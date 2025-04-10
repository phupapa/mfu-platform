import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import path from "path";
import { fileURLToPath } from "url";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

// https://vite.dev/config/
export default defineConfig({  
  base: "/elearning/",
  server: {
    host: "0.0.0.0",
    port: 5173, 
  },
  plugins: [react()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "src"), 
    },
    optimizeDeps: {
      exclude: ["i18next", "react-i18next"],
    },
  },
});
