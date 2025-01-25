<script lang="ts">
	import { X } from 'lucide-svelte';
	export let isSidebarOpen: boolean;
	export let toggleSidebar: () => void;
</script>

<!-- Sidebar structure -->
<div
	class="fixed inset-0 bg-gray-800 p-6 text-white transition-transform duration-300 ease-in-out lg:static lg:hidden lg:w-64"
	class:translate-x-0={isSidebarOpen}
	class:-translate-x-full={!isSidebarOpen}
>
	<!-- Close button -->
	<button
		class="absolute right-4 top-4 text-yellow-400 lg:hidden"
		onclick={toggleSidebar}
		aria-label="Close Sidebar"
	>
		<X />
	</button>
	<div class="mb-6 text-xl font-bold text-yellow-400">Navigation</div>

	<!-- Sidebar Links -->
	<nav>
		<ul>
			<li>
				<a
					href="/home"
					class="flex items-center space-x-3 rounded p-2 text-white hover:bg-gray-700"
				>
					<span>🏠</span>
					<span>Home</span>
				</a>
			</li>
			<li>
				<a
					href="/home/solar"
					class="flex items-center space-x-3 rounded p-2 text-white hover:bg-gray-700"
				>
					<span>☀️</span>
					<span>Solar Energy</span>
				</a>
			</li>
			<li>
				<a
					href="/home/ev"
					class="flex items-center space-x-3 rounded p-2 text-white hover:bg-gray-700"
				>
					<span>🚗</span>
					<span>Electric Vehicles</span>
				</a>
			</li>
			<li>
				<a
					href="/home/subsidies"
					class="flex items-center space-x-3 rounded p-2 text-white hover:bg-gray-700"
				>
					<span>💰</span>
					<span>Subsidies</span>
				</a>
			</li>
		</ul>
	</nav>
</div>
