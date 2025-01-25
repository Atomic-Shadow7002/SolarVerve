<script lang="ts">
	import { goto } from '$app/navigation';
	import { ArrowRight } from 'lucide-svelte';
	import { onMount } from 'svelte';
	import Footer from '$lib/components/custom/Footer.svelte';
	import GovernmentSubsidiesCard from '$lib/components/icons/GovernmentSubsidiesCard.jpg';
	import SolarEnergyCard from '$lib/components/icons/SolarEnergyCard.jpg';
	import WindTurbineCard from '$lib/components/icons/WindTurbineCard.jpg';

	// Navigation functions
	const handleTryNowClick = () => goto('/sign-up');
	const handleLearnMoreClick = () => goto('/about');

	// Heading animation
	let headingAnimation = '';
	onMount(() => {
		setTimeout(() => {
			headingAnimation = 'animate-bounce';
		}, 500);
	});
</script>

<div class="flex flex-col items-center bg-white text-gray-900">
	<!-- Hero Section -->
	<div
		class="bg-soft-yellow flex min-h-screen min-w-full flex-col items-center justify-center px-6 py-10 text-center"
	>
		<h1 class={`mb-6 text-5xl font-extrabold text-yellow-900 drop-shadow-lg ${headingAnimation}`}>
			Switch to SolarVerve Today!
		</h1>
		<p class="mb-8 text-lg font-medium text-gray-700 sm:w-3/4">
			Analyze costs, access resources, and unlock government subsidies for a greener, cleaner
			future.
		</p>
		<div class="flex space-x-6">
			<button
				class="group flex transform items-center space-x-4 rounded-full bg-gradient-to-r from-yellow-500 to-yellow-600 px-8 py-4 text-lg font-bold text-white shadow-lg transition-transform duration-300 hover:scale-105 hover:shadow-2xl"
				onclick={handleTryNowClick}
			>
				<span>Try Now</span>
				<ArrowRight class="transition-transform duration-300 group-hover:translate-x-1" />
			</button>
			<button
				class="group flex transform items-center space-x-4 rounded-full bg-yellow-400 px-8 py-4 text-lg font-bold text-white shadow-lg transition-transform duration-300 hover:scale-105 hover:shadow-2xl"
				onclick={handleLearnMoreClick}
			>
				<span>Learn More</span>
			</button>
		</div>
	</div>

	<!-- About Sustainable Energy Section -->
	<section class="flex w-full flex-col items-center bg-white px-6 py-16">
		<h2 class="mb-6 text-4xl font-bold text-yellow-700">Why Choose Sustainable Energy?</h2>
		<p class="mb-8 max-w-4xl text-center text-lg text-gray-700">
			Sustainable energy is the key to combating climate change, reducing energy bills, and securing
			a brighter future for generations to come. With SolarVerve, you can:
		</p>
		<div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
			<!-- Solar Energy Card -->
			<div
				class="card-shadow card-hover flex flex-col items-center rounded-lg bg-white p-6 text-center"
			>
				<img src={SolarEnergyCard} alt="Lower Energy Costs" class="mb-4 h-28 w-28" />
				<h3 class="mb-2 text-xl font-semibold text-yellow-700">Lower Energy Costs</h3>
				<p class="text-gray-600">
					Save money by reducing your dependency on traditional energy sources.
				</p>
			</div>

			<!-- Wind Turbine Card -->
			<div
				class="card-shadow card-hover flex flex-col items-center rounded-lg bg-white p-6 text-center"
			>
				<img src={WindTurbineCard} alt="Eco-Friendly Solutions" class="mb-4 h-28 w-28" />
				<h3 class="mb-2 text-xl font-semibold text-yellow-700">Eco-Friendly Solutions</h3>
				<p class="text-gray-600">Harness renewable resources to minimize your carbon footprint.</p>
			</div>
			<!-- Energy Efficiency Card -->
			<div
				class="card-shadow card-hover flex flex-col items-center rounded-lg bg-white p-6 text-center"
			>
				<img src={GovernmentSubsidiesCard} alt="Government Subsidies" class="mb-4 h-28 w-28" />
				<h3 class="mb-2 text-xl font-semibold text-yellow-700">Government Subsidies</h3>
				<p class="text-gray-600">
					Take advantage of government programs to make the switch affordable.
				</p>
			</div>
		</div>
	</section>

	<!-- Features Section -->
	<section class="w-full bg-gray-50 px-6 py-16 text-center">
		<h2 class="mb-6 text-4xl font-bold text-yellow-700">Our Features</h2>
		<div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-4">
			<div class="rounded-lg bg-white p-6 shadow-lg hover:shadow-xl">
				<h3 class="mb-4 text-xl font-bold text-yellow-700">Cost Analysis</h3>
				<p class="text-gray-700">
					Comprehensive tools to analyze the cost-effectiveness of switching to solar energy.
				</p>
			</div>
			<div class="rounded-lg bg-white p-6 shadow-lg hover:shadow-xl">
				<h3 class="mb-4 text-xl font-bold text-yellow-700">Installation Guides</h3>
				<p class="text-gray-700">
					Step-by-step instructions for installing solar panels and other renewable energy systems.
				</p>
			</div>
			<div class="rounded-lg bg-white p-6 shadow-lg hover:shadow-xl">
				<h3 class="mb-4 text-xl font-bold text-yellow-700">Community Support</h3>
				<p class="text-gray-700">
					Connect with others in the renewable energy community for tips and advice.
				</p>
			</div>
			<div class="rounded-lg bg-white p-6 shadow-lg hover:shadow-xl">
				<h3 class="mb-4 text-xl font-bold text-yellow-700">Future Planning</h3>
				<p class="text-gray-700">
					Tools and resources to plan for a sustainable future powered by renewable energy.
				</p>
			</div>
		</div>
	</section>

	<!-- Footer Section -->
	<Footer />
</div>

<style>
	/* Custom Styles */
	.bg-soft-yellow {
		background-color: #fef9e7; /* Soft yellow for a soothing look */
	}

	.text-yellow-primary {
		color: #f9a825; /* Warm yellow for text */
	}

	.card-shadow {
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	}

	.card-hover:hover {
		box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
		transform: translateY(-5px);
	}

	.btn-gradient {
		background-color: #ffd54f;
		color: white;
	}

	.btn-gradient:hover {
		background-color: #ffca28;
	}
</style>
