export const actions = {
    default: async ({ request }) => {
        const { location, systemSize } = await request.json();
        // Example logic
        const cost = systemSize * 1000; // Placeholder calculation
        return { cost };
    }
};
