import React from 'react';
import ReactDOM from 'react-dom/client';
import { ThemeProvider, createTheme, responsiveFontSizes } from '@mui/material/styles';
import App from './App';
import './index.css';

const rootElement = document.getElementById('root');
if (!rootElement) {
  throw new Error('Root element not found');
}

let theme = createTheme({
  palette: {
    mode: 'light',
    primary: {
      main: '#1f2933'
    },
    secondary: {
      main: '#374151'
    },
    background: {
      default: '#f5f5f5',
      paper: '#ffffff'
    },
    text: {
      primary: '#111827',
      secondary: '#4b5563'
    }
  },
  typography: {
    fontFamily:
      "'Inter', 'Segoe UI', -apple-system, BlinkMacSystemFont, 'Helvetica Neue', Arial, sans-serif",
    fontWeightBold: 600
  },
  shape: {
    borderRadius: 6
  },
  components: {
    MuiButton: {
      styleOverrides: {
        root: {
          borderRadius: 4,
          fontWeight: 500
        },
        containedPrimary: {
          backgroundColor: '#1f2933',
          color: '#f9fafb',
          '&:hover': {
            backgroundColor: '#111827'
          }
        },
        outlinedPrimary: {
          borderColor: '#4b5563',
          color: '#1f2933',
          '&:hover': {
            borderColor: '#111827',
            backgroundColor: '#f9fafb'
          }
        }
      }
    },
    MuiPaper: {
      defaultProps: {
        elevation: 0
      }
    },
    MuiToggleButton: {
      styleOverrides: {
        root: {
          borderColor: '#d1d5db',
          color: '#4b5563',
          '&.Mui-selected': {
            backgroundColor: '#e5e7eb',
            color: '#111827'
          }
        }
      }
    },
    MuiAlert: {
      styleOverrides: {
        root: {
          borderRadius: 4,
          border: '1px solid #d1d5db',
          backgroundColor: '#ffffff',
          color: '#111827'
        },
        icon: {
          color: '#6b7280'
        },
        standardSuccess: {
          backgroundColor: '#ffffff',
          color: '#111827'
        },
        standardError: {
          backgroundColor: '#ffffff',
          color: '#111827'
        },
        standardInfo: {
          backgroundColor: '#ffffff',
          color: '#111827'
        }
      }
    }
  }
});

theme = responsiveFontSizes(theme);

ReactDOM.createRoot(rootElement).render(
  <React.StrictMode>
    <ThemeProvider theme={theme}>
      <App />
    </ThemeProvider>
  </React.StrictMode>
);
