export const actions = {
	default: async ({ request }) => {
		const { systemSize } = await request.json();
		// Example logic
		const cost = systemSize * 1000; // Placeholder calculation
		return { cost };
	}
};
