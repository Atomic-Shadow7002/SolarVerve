<script lang="ts">
	let location = '';
	let systemSize = 5; // default in kW

	const calculate = async () => {
		const response = await fetch('/solar/cost-analysis', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ location, systemSize })
		});
		const result = await response.json();
		console.log(result);
	};
</script>

<form on:submit|preventDefault={calculate}>
	<label>
		Location:
		<input type="text" bind:value={location} required />
	</label>
	<label>
		System Size (kW):
		<input type="number" bind:value={systemSize} min="1" required />
	</label>
	<button type="submit">Calculate</button>
</form>
