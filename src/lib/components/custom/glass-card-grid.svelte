<script lang="ts">
	import { cn } from '$lib/utils';
	import { ArrowRight } from 'lucide-svelte';

	type Entry = {
		// eslint-disable-next-line @typescript-eslint/no-explicit-any
		icon: any;
		title: string;
		description: string;
		link?: string;
	};

	let { entries }: { entries: Entry[] } = $props();
</script>

<!-- <div
  class="absolute inset-0 rounded-3xl bg-gradient-to-r from-primary/15 via-accent/15 to-primary/15 blur-3xl"
></div> -->

<div class="relative grid grid-cols-1 gap-8 px-4 py-8 md:grid-cols-3 md:p-8">
	{#each entries as entry}
		<div
			class={cn(
				'border-border/30 bg-background/40 group rounded-2xl border p-6 backdrop-blur-xl transition-all duration-300',
				'hover:border-border/50 hover:-translate-y-2 hover:shadow-lg md:p-8'
			)}
		>
			<div
				class="bg-primary/10 mb-6 flex h-12 w-12 items-center justify-center rounded-xl transition-transform duration-300 group-hover:scale-110"
			>
				<entry.icon class="text-primary h-6 w-6" />
			</div>
			<h3 class="mb-3 text-xl font-semibold">{entry.title}</h3>
			<p class="text-muted-foreground/70">{entry.description}</p>
			{#if entry.link}
				<a
					href={entry.link}
					class="text-primary mt-4 inline-flex items-center gap-2 text-sm opacity-70 transition-all duration-300 hover:underline hover:opacity-100"
				>
					Read more
					<ArrowRight class="h-4 w-4 transition-transform duration-300 group-hover:translate-x-1" />
				</a>
			{/if}
		</div>
	{/each}
</div>
