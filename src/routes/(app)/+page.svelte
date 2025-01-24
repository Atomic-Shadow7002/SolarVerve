<script lang="ts">
    export let data: { username: string | null };
</script>

<div class="container">
    <h1>Welcome to SolarVerve 🌞</h1>
    <p>Empowering households to adopt solar energy and electric vehicles.</p>
    {#if data.username}
        <p>Hello, {data.username}!</p>
    {/if}
    <div class="links">
        <a href="/solar" class="button">Explore Solar Solutions</a>
        <a href="/ev" class="button">Electric Vehicle Resources</a>
        <a href="/subsidies" class="button">Government Subsidies</a>
    </div>
</div>

<style>
    .container {
        text-align: center;
        padding: 2rem;
    }
    h1 {
        color: #ffcc00;
    }
    .links .button {
        display: inline-block;
        background-color: #ffcc00;
        color: #000;
        padding: 0.8rem 1.2rem;
        text-decoration: none;
        border-radius: 8px;
        margin: 0.5rem;
    }
    .links .button:hover {
        background-color: #e6b800;
    }
</style>
