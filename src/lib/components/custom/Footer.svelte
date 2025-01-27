<script lang="ts">
	import { Facebook, Twitter, Linkedin, Instagram } from 'lucide-svelte'; // Importing required icons from lucide-svelte

	// Define social media and navigation links
	const socialLinks = [
		{ name: 'Facebook', href: 'https://facebook.com', icon: Facebook },
		{ name: 'Twitter', href: 'https://twitter.com', icon: Twitter },
		{ name: 'LinkedIn', href: 'https://linkedin.com', icon: Linkedin },
		{ name: 'Instagram', href: 'https://instagram.com', icon: Instagram }
	];

	const navLinks = [
		{ name: 'Home', href: '/' },
		{ name: 'About Us', href: '/about' },
		{ name: 'Features', href: '/features' },
		{ name: 'Contact', href: '/contact' }
	];
</script>

<footer class="w-full bg-gradient-to-br from-yellow-50 via-yellow-100 to-yellow-200 py-8">
	<div class="mx-auto max-w-full px-6 sm:px-12">
		<div class="grid grid-cols-1 gap-8 sm:grid-cols-2 lg:grid-cols-3">
			<!-- Brand Section -->
			<div class="mb-6 flex flex-col">
				<h2 class="text-4xl font-extrabold text-yellow-900">SolarVerve</h2>
				<p class="mt-2 max-w-xs text-sm text-yellow-800">
					Empowering a sustainable future with accessible renewable energy solutions.
				</p>
			</div>

			<!-- Navigation Links -->
			<div class="mb-6">
				<h3 class="mb-4 text-2xl font-bold text-yellow-900">Quick Links</h3>
				<ul class="space-y-2">
					{#each navLinks as link}
						<li>
							<a
								href={link.href}
								class="text-lg text-yellow-700 transition-colors duration-200 hover:text-yellow-600"
								aria-label={`Navigate to ${link.name}`}
							>
								{link.name}
							</a>
						</li>
					{/each}
				</ul>
			</div>

			<!-- Social Media Links -->
			<div class="mb-6">
				<h3 class="mb-4 text-2xl font-bold text-yellow-900">Follow Us</h3>
				<div class="flex space-x-6">
					{#each socialLinks as social}
						<a
							href={social.href}
							target="_blank"
							rel="noopener noreferrer"
							class="flex h-12 w-12 items-center justify-center rounded-full bg-white text-yellow-600 shadow-lg transition-transform duration-300 hover:scale-110 hover:bg-yellow-600 hover:text-white hover:shadow-xl"
							aria-label={`Visit our ${social.name} page`}
						>
							<svelte:component this={social.icon} class="h-6 w-6" />
						</a>
					{/each}
				</div>
			</div>
		</div>

		<!-- Footer Bottom -->
		<div class="mt-8 border-t border-yellow-300 pt-4 text-center text-sm text-yellow-700">
			&copy; {new Date().getFullYear()} SolarVerve. All Rights Reserved. | Designed for a sustainable
			future.
		</div>
	</div>
</footer>
