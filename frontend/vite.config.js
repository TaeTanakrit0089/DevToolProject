import {defineConfig} from "vite";
// import react from "@vitejs/plugin-react";
import tailwindcss from "tailwindcss";
import path from 'path';

// https://vitejs.dev/config/
export default defineConfig({
    server: {
        port: 3000,
        host: true,
        strictPort: true,   // Fail if port 8083 is not available
        watch: {
            usePolling: true  // Useful if you're running in environments like Docker or cloud VMs
        }
    },
    plugins: [
        
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './pages'),  // Alias for the /src directory
        },
    },
    css: {
        postcss: {
            plugins: [tailwindcss()],
        },
    },

});

