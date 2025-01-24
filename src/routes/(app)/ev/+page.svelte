<script lang="ts">
    let resources = [
        { title: "EV Charging Stations", link: "#" },
        { title: "Government EV Policies", link: "#" },
        { title: "EV Benefits and FAQs", link: "#" }
    ];
</script>

<div class="container">
    <h2>Electric Vehicles</h2>
    <ul>
        {#each resources as resource}
            <li><a href={resource.link}>{resource.title}</a></li>
        {/each}
    </ul>
</div>

<style>
    h2 {
        color: #ffcc00;
    }
    ul {
        list-style: none;
        padding: 0;
    }
    li a {
        text-decoration: none;
        color: #ffcc00;
    }
</style>
