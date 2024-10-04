/** @type {import('tailwindcss').Config} */
export default {
    content: ['./index.html', './*/templates/**/*.html'],
    theme: {
        extend: {
            colors: {
                white: "#ffffff",
                black: "#0e0e11",
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
            }
        }
    },
    plugins: [],
}