class ObfuscationError(Exception):
    """Base exception for obfuscation failures."""


class ToolchainNotFoundError(ObfuscationError):
    """Raised when required toolchain binaries are missing."""


class ReportGenerationError(ObfuscationError):
    """Raised when report generation fails."""


class JobNotFoundError(KeyError):
    """Raised when a job lookup fails."""


class ValidationError(ObfuscationError):
    """Raised when input validation fails."""
