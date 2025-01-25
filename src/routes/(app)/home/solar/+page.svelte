<script lang="ts">
	let systemSize = 5;
	let location = '';
	let estimatedCost = 0;

	async function calculateCost() {
		const response = await fetch('/solar/cost-analysis', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ systemSize, location })
		});
		const result = await response.json();
		estimatedCost = result.estimatedCost;
	}
</script>

<div class="container">
	<h2>Solar Solutions</h2>
	<form on:submit|preventDefault={calculateCost}>
		<label>
			Location:
			<input type="text" bind:value={location} required />
		</label>
		<label>
			System Size (kW):
			<input type="number" bind:value={systemSize} min="1" required />
		</label>
		<button type="submit" class="button">Calculate</button>
	</form>

	{#if estimatedCost}
		<p>Estimated Cost: ₹{estimatedCost}</p>
	{/if}
</div>

<style>
	h2 {
		color: #ffcc00;
	}
	label {
		display: block;
		margin: 1rem 0;
	}
	.button {
		background-color: #ffcc00;
		border: none;
		padding: 0.8rem 1.2rem;
		border-radius: 6px;
		cursor: pointer;
	}
</style>
