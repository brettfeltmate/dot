const hintsCss =
  "font-size: 13pt; font-family: 'JetBrains Mono NL', 'Cascadia Code', 'Helvetica Neue', Helvetica, Arial, sans-serif; border: 0px; color: #e0def4 !important; background: #191724; background-color: #191724";

api.Hints.style(hintsCss);
api.Hints.style(hintsCss, "text");

// Import theme CSS
const response = await fetch(chrome.runtime.getURL('themes/rose-pine.css'));
settings.theme = await response.text();
