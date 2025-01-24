<script lang="ts">
	let { title, description = '', Icon, ...rest } = $props();
</script>

<div class="relative mb-12 text-center" {...rest}>
	<div
		class="from-primary/10 via-accent/10 to-primary/10 absolute -inset-[50px] animate-[pulse_6s_ease-in-out_infinite] rounded-full bg-gradient-to-r opacity-30 blur-2xl"
	></div>
	<div class="flex flex-col items-center justify-center gap-3 md:flex-row">
		<div class="bg-primary/10 rounded-xl p-3">
			<Icon class="text-primary h-8 w-8" />
		</div>
		<h3 class="text-primary text-3xl font-bold">{title}</h3>
	</div>
	{#if description}
		<p class="text-muted-foreground/80 mx-auto mt-4 max-w-2xl text-lg leading-relaxed">
			{description}
		</p>
	{/if}
</div>
