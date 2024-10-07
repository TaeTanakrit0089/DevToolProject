/** @type {import('tailwindcss').Config} */
export default {
    darkMode: 'media', // or 'class' if you want to control it manually
    content: ['./index.html', './*/templates/**/*.html'],
    theme: {
        extend: {
            colors: {
                white: "#ffffff",
                black: "#0e0e11",
                'gray2': "#27272a",
                'black2': "#18181b",
                'brown': {
                    50: '#faf7f6',
                    100: '#f6eeed',
                    200: '#ede0de',
                    300: '#dec7c3',
                    400: '#cba6a1',
                    500: '#b5837e',
                    600: '#9d6361',
                    700: '#824e4e',
                    800: '#6b4142',
                    900: '#5f3c3e',
                    950: '#331e1f',
                },
                blue: {
                    50: '#f0f5fd',
                    100: '#e6ecfc',
                    200: '#dce3fa',
                    300: '#c7d2f6',
                    400: '#a4b4f0',
                    500: '#8096ea',
                    600: '#6a81e3',
                    700: '#5769da',
                    800: '#4552d1',
                    900: '#363ec4',
                    950: '#282d99',
                }
            }
        }
    },
    plugins: [],
}
