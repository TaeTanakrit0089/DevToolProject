<template>
  <div
      class="min-h-screen flex items-center justify-center bg-gradient-to-r from-indigo-500 via-purple-500 to-pink-500 text-gray-900 dark:text-white">
    <div
        class="text-center p-8 bg-white dark:bg-gray-800 rounded-xl shadow-2xl transform hover:scale-105 transition-transform duration-500 ease-in-out">
      <h1 class="text-5xl font-extrabold mb-6 bg-clip-text text-transparent bg-gradient-to-r from-blue-500 to-teal-400 animate-pulse">
        Welcome to Tailwind
      </h1>
      <p class="text-lg font-medium mb-6 text-gray-700 dark:text-gray-300">
        Light and dark modes with smooth transitions.
      </p>
      <a href="https://youtu.be/Ap-gi3LrCoA?si=ovOmbbulqQJS50NF" target="_blank">
        <button
            class="px-6 py-3 bg-gradient-to-r from-blue-500 to-teal-400 text-white font-semibold rounded-full shadow-lg hover:bg-gradient-to-l hover:from-teal-400 hover:to-blue-500 dark:bg-gradient-to-r dark:from-gray-700 dark:to-gray-900 dark:hover:from-gray-800 dark:hover:to-gray-700 transition-colors duration-300">
          Get Started
        </button>
      </a>
      <div class="mt-6">
        <img src="assets/img/emailspin.gif" height="66" width="50"
             class="inline-block shadow-lg animate-spin-slow" alt=""/>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'App',
};
</script>

<style>
/* Slow down the spin animation for a smoother effect */
@keyframes spin-slow {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.animate-spin-slow {
  animation: spin-slow 4s linear infinite;
}
</style>
