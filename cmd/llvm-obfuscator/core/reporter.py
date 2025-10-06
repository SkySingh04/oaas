from __future__ import annotations

from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List

from .exceptions import ReportGenerationError
from .utils import get_timestamp, write_html, write_json, write_pdf_placeholder


class ObfuscationReport:
    """Generate comprehensive obfuscation report per SIH requirements."""

    def __init__(self, output_dir: Path) -> None:
        self.output_dir = output_dir

    def generate_report(self, job_data: Dict[str, Any]) -> Dict[str, Any]:
        try:
            report = {
                "input_parameters": {
                    "source_file": job_data.get("source_file"),
                    "platform": job_data.get("platform"),
                    "obfuscation_level": job_data.get("obfuscation_level"),
                    "enabled_passes": job_data.get("enabled_passes", []),
                    "compiler_flags": job_data.get("compiler_flags", []),
                    "timestamp": job_data.get("timestamp", get_timestamp()),
                },
                "output_attributes": job_data.get("output_attributes", {}),
                "bogus_code_info": job_data.get("bogus_code_info", {}),
                "cycles_completed": job_data.get("cycles_completed", {}),
                "string_obfuscation": job_data.get("string_obfuscation", {}),
                "fake_loops_inserted": job_data.get("fake_loops_inserted", {}),
                "obfuscation_score": job_data.get("obfuscation_score", 0.0),
                "symbol_reduction": job_data.get("symbol_reduction", 0.0),
                "function_reduction": job_data.get("function_reduction", 0.0),
                "size_reduction": job_data.get("size_reduction", 0.0),
                "entropy_increase": job_data.get("entropy_increase", 0.0),
                "estimated_re_effort": job_data.get("estimated_re_effort", "4-6 weeks"),
            }
        except Exception as exc:  # pragma: no cover - defensive
            raise ReportGenerationError("Failed to assemble report") from exc
        return report

    def export(self, report: Dict[str, Any], job_id: str, formats: List[str]) -> Dict[str, Path]:
        outputs: Dict[str, Path] = {}
        for fmt in formats:
            fmt_lower = fmt.lower()
            if fmt_lower == "json":
                path = self.output_dir / f"{job_id}.json"
                write_json(path, report)
                outputs["json"] = path
            elif fmt_lower == "html":
                path = self.output_dir / f"{job_id}.html"
                html = self._render_html(report)
                write_html(path, html)
                outputs["html"] = path
            elif fmt_lower == "pdf":
                path = self.output_dir / f"{job_id}.pdf"
                write_pdf_placeholder(path)
                outputs["pdf"] = path
        return outputs

    def _render_html(self, report: Dict[str, Any]) -> str:
        timestamp = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
        sections = []
        for section, data in report.items():
            rows = "".join(
                f"<tr><td>{key}</td><td>{value}</td></tr>"
                for key, value in (data.items() if isinstance(data, dict) else enumerate(data))
            )
            sections.append(f"<h2>{section.replace('_', ' ').title()}</h2><table>{rows}</table>")
        html = f"""
        <html>
          <head>
            <meta charset='utf-8'>
            <title>LLVM Obfuscation Report</title>
            <style>
              body {{ font-family: Arial, sans-serif; margin: 2rem; }}
              table {{ border-collapse: collapse; width: 100%; margin-bottom: 2rem; }}
              th, td {{ border: 1px solid #ccc; padding: 0.5rem; text-align: left; }}
              h1 {{ color: #333; }}
            </style>
          </head>
          <body>
            <h1>Obfuscation Report</h1>
            <p>Generated: {timestamp}</p>
            {''.join(sections)}
          </body>
        </html>
        """
        return html
