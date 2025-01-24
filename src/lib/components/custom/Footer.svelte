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

<footer class="bg-gradient-to-br from-green-50 via-green-100 to-green-200 py-8">
	<div class="max-w-7xl mx-auto px-6 sm:px-12">
		<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
			<!-- Brand Section -->
			<div class="mb-6 flex flex-col">
				<h2 class="text-4xl font-extrabold text-green-900">SolarVerve</h2>
				<p class="mt-2 text-sm text-green-800 max-w-xs">
					Empowering a sustainable future with accessible renewable energy solutions.
				</p>
			</div>

			<!-- Navigation Links -->
			<div class="mb-6">
				<h3 class="mb-4 text-2xl font-bold text-green-900">Quick Links</h3>
				<ul class="space-y-2">
					{#each navLinks as link}
						<li>
							<a 
								href={link.href} 
								class="text-green-700 hover:text-green-600 transition-colors duration-200 text-lg"
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
				<h3 class="mb-4 text-2xl font-bold text-green-900">Follow Us</h3>
				<div class="flex space-x-6">
					{#each socialLinks as social}
						<a
							href={social.href}
							target="_blank"
							rel="noopener noreferrer"
							class="w-12 h-12 flex items-center justify-center rounded-full bg-white text-green-600 shadow-lg transition-transform duration-300 hover:scale-110 hover:shadow-xl hover:bg-green-600 hover:text-white"
							aria-label={`Visit our ${social.name} page`}
						>
							<svelte:component this={social.icon} class="w-6 h-6" />
						</a>
					{/each}
				</div>
			</div>
		</div>

		<!-- Footer Bottom -->
		<div class="mt-8 border-t border-green-300 pt-4 text-center text-sm text-green-700">
			&copy; {new Date().getFullYear()} SolarVerve. All Rights Reserved. | Designed for a sustainable future.
		</div>
	</div>
</footer>
