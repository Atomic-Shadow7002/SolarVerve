<script lang="ts">
    import { onMount } from 'svelte';
    import { ArrowRight } from 'lucide-svelte';
  
    // Data for dropdowns and calculations
    const locations = ['Urban', 'Suburban', 'Rural'];
    const energyNeeds = ['Low (1-2 kWh/day)', 'Medium (3-5 kWh/day)', 'High (6+ kWh/day)'];
    const budgetRanges = ['< ₹50,000', '₹50,000 - ₹1,00,000', '> ₹1,00,000'];
  
    // Form state
    let selectedLocation = '';
    let selectedEnergyNeed = '';
    let selectedBudget = '';
    let result = '';
  
    // Calculate recommendations
    const calculateRecommendations = () => {
      if (!selectedLocation || !selectedEnergyNeed || !selectedBudget) {
        result = 'Please fill out all the fields to get recommendations.';
        return;
      }
  
      // Placeholder logic for recommendations
      result = `
        Based on your inputs:
        - Location: ${selectedLocation}
        - Energy Need: ${selectedEnergyNeed}
        - Budget: ${selectedBudget}
        
        We recommend installing:
        - 5kW Solar Panels for maximum efficiency
        - EV Charging Setup, if applicable
        - Access subsidies in your region to save ₹30,000 on installation costs.
      `;
    };
  
    onMount(() => {
      result = '';
    });
  </script>
  
  <div class="flex flex-col items-center bg-gray-50">
    <!-- Header -->
    <section class="w-full bg-gradient-to-br from-yellow-100 to-yellow-200 px-6 py-16 text-center">
      <h1 class="mb-6 text-4xl font-bold text-yellow-900">Your Custom Renewable Energy Plan</h1>
      <p class="mb-8 max-w-3xl text-lg font-medium text-gray-700">
        Fill out the form below to discover how SolarVerve can help you transition to renewable energy.
      </p>
    </section>
  
    <!-- Form Section -->
    <section class="flex w-full max-w-4xl flex-col items-center bg-white px-6 py-16 shadow-md rounded-2xl">
      <h2 class="mb-6 text-2xl font-bold text-yellow-700">Tell Us About Yourself</h2>
      <form
        on:submit|preventDefault={calculateRecommendations}
        class="flex w-full flex-col space-y-6"
      >
        <!-- Location Input -->
        <div class="flex flex-col">
          <label for="location" class="mb-2 text-lg font-medium text-gray-600">Your Location</label>
          <select
            id="location"
            bind:value={selectedLocation}
            class="rounded-md border-gray-300 p-3 text-gray-700 shadow-sm focus:border-yellow-500 focus:ring-yellow-500"
          >
            <option value="" disabled selected>-- Select Location --</option>
            {#each locations as location}
              <option value={location}>{location}</option>
            {/each}
          </select>
        </div>
  
        <!-- Energy Need Input -->
        <div class="flex flex-col">
          <label for="energy-need" class="mb-2 text-lg font-medium text-gray-600">Energy Needs</label>
          <select
            id="energy-need"
            bind:value={selectedEnergyNeed}
            class="rounded-md border-gray-300 p-3 text-gray-700 shadow-sm focus:border-yellow-500 focus:ring-yellow-500"
          >
            <option value="" disabled selected>-- Select Energy Needs --</option>
            {#each energyNeeds as need}
              <option value={need}>{need}</option>
            {/each}
          </select>
        </div>
  
        <!-- Budget Input -->
        <div class="flex flex-col">
          <label for="budget" class="mb-2 text-lg font-medium text-gray-600">Budget Range</label>
          <select
            id="budget"
            bind:value={selectedBudget}
            class="rounded-md border-gray-300 p-3 text-gray-700 shadow-sm focus:border-yellow-500 focus:ring-yellow-500"
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
          class="flex items-center justify-center rounded-full bg-yellow-500 px-6 py-3 text-lg font-bold text-white shadow-lg transition-transform hover:scale-105 hover:shadow-xl"
        >
          <span>Calculate</span>
          <ArrowRight class="ml-3" />
        </button>
      </form>
    </section>
  
    <!-- Results Section -->
    {#if result}
      <section class="mt-12 w-full max-w-4xl bg-yellow-50 px-6 py-8 rounded-2xl shadow-md">
        <h3 class="mb-4 text-xl font-semibold text-yellow-800">Your Results</h3>
        <p class="whitespace-pre-line text-gray-700">{result}</p>
      </section>
    {/if}
  </div>
  
  <style>
    select:invalid {
      color: gray;
    }
  </style>
  