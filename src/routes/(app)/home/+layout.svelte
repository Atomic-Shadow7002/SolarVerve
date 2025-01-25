<script lang="ts">
	import Sidebar from '$lib/components/custom/Sidebar.svelte';
	import Navbar from '$lib/components/custom/Navbar.svelte';

	let isSidebarOpen = false; // Initial state for sidebar

	// Function to toggle sidebar visibility
	const toggleSidebar = () => {
		isSidebarOpen = !isSidebarOpen;
	};
</script>

<!-- Layout structure -->
<div class="flex h-screen flex-col">
	<!-- Navbar -->
	<Navbar {toggleSidebar} />

	<!-- Sidebar -->
	<Sidebar {isSidebarOpen} {toggleSidebar} />

	<!-- Main content -->
	<div
		class="flex-1 bg-gray-100 p-6 transition-all duration-300 ease-in-out"
		class:ml-64={isSidebarOpen}
		class:ml-0={!isSidebarOpen}
	>
		<slot />
		<!-- Content will be injected here -->
	</div>
</div>
