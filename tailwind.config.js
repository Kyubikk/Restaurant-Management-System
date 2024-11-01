module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.{js, jsx, vue}'
  ],
  theme: {
    extend: {
      colors: {
        primary: '#762508',     // Màu chính
        secondary: '#f6e4c5',   // Màu phụ
        accent: '#c6a361',      // Màu nhấn
        light: '#fefefe',       // Màu sáng
        danger: '#f07422',      // Màu nguy hiểm
        'primary-text': '#ffffff', // Màu chữ cho nút primary
        'secondary-text': '#333333', // Màu chữ cho nút secondary
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/line-clamp'),
  ]
}