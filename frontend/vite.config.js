import {defineConfig} from "vite";
// import react from "@vitejs/plugin-react";
import tailwindcss from "tailwindcss";
import VueDevTools from 'vite-plugin-vue-devtools';
import vue from '@vitejs/plugin-vue';
import path from 'path';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [
        VueDevTools(),
        vue(),
        // react(),
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './src'),  // Alias for the /src directory
        },
    },
    css: {
        postcss: {
            plugins: [tailwindcss()],
        },
    },

});

