<script lang="ts">
	import { Menu } from 'lucide-svelte';
	export let toggleSidebar: () => void; // Function to toggle sidebar visibility
</script>

<!-- Navbar structure -->
<div class="flex items-center justify-between bg-gray-800 p-4 text-white">
	<!-- Brand name -->
	<div class="text-2xl font-bold text-yellow-400">Dashboard</div>

	<!-- Hamburger Icon (visible only on small screens) -->
	<button
		class="flex items-center space-x-2 text-yellow-400 lg:hidden"
		onclick={toggleSidebar}
		aria-label="Toggle Sidebar"
	>
		<Menu />
	</button>

	<!-- Desktop Links (visible only on large screens) -->
	<div class="hidden space-x-6 lg:flex">
		<a href="/home" class="text-yellow-400 hover:text-white">Home</a>
		<a href="/home/solar" class="text-yellow-400 hover:text-white">Solar Energy</a>
		<a href="/home/ev" class="text-yellow-400 hover:text-white">Electric Vehicles</a>
		<a href="/home/subsidies" class="text-yellow-400 hover:text-white">Subsidies</a>
	</div>
</div>
