<script lang="ts">
	import { goto } from '$app/navigation';
	import { ArrowRight } from 'lucide-svelte';

	// Function to navigate to the sign-up page
	function handleTryNowClick() {
		goto('/sign-up');
	}
</script>

<div class="flex min-h-screen flex-col items-center justify-center bg-yellow-50 py-10 text-center">
	<h1 class="mb-4 text-5xl font-extrabold text-yellow-500 shadow-lg">
		Switch to SolarVerve Today!
	</h1>
	<p class="mb-6 text-lg text-gray-600">
		Analyze costs, access resources, and unlock government subsidies for a greener future.
	</p>
	<button
		class="flex transform items-center space-x-2 rounded-lg bg-gradient-to-r from-yellow-400 to-yellow-500 px-6 py-3 text-xl text-gray-800 shadow-lg transition-all duration-300 hover:scale-105"
		onclick={handleTryNowClick}
	>
		<span>Try Now</span>
		<ArrowRight />
	</button>
	<div class="mt-10 w-full max-w-2xl">
		<img
			class="w-full rounded-lg shadow-xl"
			src="https://source.unsplash.com/featured/?solar,green-energy"
			alt="Solar Panels and Sustainability"
		/>
	</div>
</div>
