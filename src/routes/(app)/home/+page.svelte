<script lang="ts">
    import { onMount } from 'svelte';
    import { ArrowRight } from 'lucide-svelte';
  
    const locations = ['Urban', 'Suburban', 'Rural'];
    const energyNeeds = ['Low (1-2 kWh/day)', 'Medium (3-5 kWh/day)', 'High (6+ kWh/day)'];
    const budgetRanges = ['< ₹50,000', '₹50,000 - ₹1,00,000', '> ₹1,00,000'];
  
    let selectedLocation = '';
    let selectedEnergyNeed = '';
    let selectedBudget = '';
    let result = '';
  
    const calculateRecommendations = () => {
      if (!selectedLocation || !selectedEnergyNeed || !selectedBudget) {
        result = 'Please fill out all the fields to get recommendations.';
        return;
      }
  
      const subsidy =
        selectedLocation === 'Rural'
          ? 30000
          : selectedLocation === 'Suburban'
          ? 20000
          : 10000;
  
      let systemSize = 0;
      let costEstimate = 0;
  
      switch (selectedEnergyNeed) {
        case 'Low (1-2 kWh/day)':
          systemSize = 2;
          costEstimate = 50000;
          break;
        case 'Medium (3-5 kWh/day)':
          systemSize = 5;
          costEstimate = 100000;
          break;
        case 'High (6+ kWh/day)':
          systemSize = 10;
          costEstimate = 200000;
          break;
      }
  
      if (selectedBudget === '< ₹50,000') {
        result = `
          Your budget is too low for renewable energy installation. 
          Consider increasing it or exploring subsidy-only options.
        `;
        return;
      } else if (selectedBudget === '₹50,000 - ₹1,00,000' && systemSize > 2) {
        result = `
          Your budget may be insufficient for the selected energy needs. 
          We recommend starting with a smaller system (e.g., 2 kW) and scaling later.
        `;
        return;
      }
  
      const netCost = costEstimate - subsidy;
  
      result = `
        Based on your inputs:
        - Location: ${selectedLocation}
        - Energy Need: ${selectedEnergyNeed}
        - Budget: ${selectedBudget}
        
        We recommend installing:
        - A ${systemSize} kW solar panel system
        - Approximate cost before subsidies: ₹${costEstimate.toLocaleString()}
        - Subsidies available: ₹${subsidy.toLocaleString()}
        - Estimated cost after subsidies: ₹${netCost.toLocaleString()}
        
        Additional Suggestions:
        - EV Charging Setup: ${selectedEnergyNeed === 'High (6+ kWh/day)' ? 'Recommended' : 'Optional'}
      `;
    };
  
    onMount(() => {
      result = '';
    });
  </script>
  
  <div class="flex flex-col items-center bg-gray-50 min-h-screen px-4">
    <!-- Header -->
    <section class="w-full bg-gradient-to-br from-yellow-400 to-yellow-300 px-6 py-16 text-center shadow-lg">
      <h1 class="mb-4 text-5xl font-extrabold text-yellow-900">Solar Energy Planner</h1>
      <p class="max-w-3xl mx-auto text-lg font-medium text-gray-800">
        Customize your energy plan with SolarVerve! Let us help you make the switch to renewable energy.
      </p>
    </section>
  
    <!-- Form Section -->
    <section class="mt-12 w-full max-w-4xl bg-white px-8 py-12 shadow-lg rounded-2xl">
      <h2 class="mb-6 text-3xl font-bold text-yellow-600">Tell Us About Yourself</h2>
      <form on:submit|preventDefault={calculateRecommendations} class="space-y-8">
        <!-- Location Input -->
        <div>
          <label for="location" class="block mb-2 text-lg font-medium text-gray-700">Your Location</label>
          <select
            id="location"
            bind:value={selectedLocation}
            class="w-full rounded-lg border border-gray-300 p-3 text-gray-700 shadow focus:border-yellow-500 focus:ring focus:ring-yellow-200"
          >
            <option value="" disabled selected>-- Select Location --</option>
            {#each locations as location}
              <option value={location}>{location}</option>
            {/each}
          </select>
        </div>
  
        <!-- Energy Need Input -->
        <div>
          <label for="energy-need" class="block mb-2 text-lg font-medium text-gray-700">Energy Needs</label>
          <select
            id="energy-need"
            bind:value={selectedEnergyNeed}
            class="w-full rounded-lg border border-gray-300 p-3 text-gray-700 shadow focus:border-yellow-500 focus:ring focus:ring-yellow-200"
          >
            <option value="" disabled selected>-- Select Energy Needs --</option>
            {#each energyNeeds as need}
              <option value={need}>{need}</option>
            {/each}
          </select>
        </div>
  
        <!-- Budget Input -->
        <div>
          <label for="budget" class="block mb-2 text-lg font-medium text-gray-700">Budget Range</label>
          <select
            id="budget"
            bind:value={selectedBudget}
            class="w-full rounded-lg border border-gray-300 p-3 text-gray-700 shadow focus:border-yellow-500 focus:ring focus:ring-yellow-200"
          >
            <option value="" disabled selected>-- Select Budget --</option>
            {#each budgetRanges as budget}
              <option value={budget}>{budget}</option>
            {/each}
          </select>
        </div>
  
        <!-- Submit Button -->
        <button
          type="submit"
          class="flex items-center justify-center w-full rounded-full bg-yellow-500 px-6 py-3 text-lg font-bold text-white shadow-lg hover:bg-yellow-600 hover:shadow-xl"
        >
          <span>Calculate</span>
          <ArrowRight class="ml-3" />
        </button>
      </form>
    </section>
  
    <!-- Results Section -->
    {#if result}
      <section class="mt-8 w-full max-w-4xl bg-yellow-50 px-8 py-6 shadow-md rounded-2xl">
        <h3 class="mb-4 text-2xl font-bold text-yellow-700">Your Results</h3>
        <p class="whitespace-pre-line text-gray-700 leading-7">{result}</p>
      </section>
    {/if}
  </div>
  
  <style>
    select:invalid {
      color: gray;
    }
  </style>
  