<script lang="ts">
    let subsidies = [
        { title: "Solar Panel Installation Subsidy", details: "Up to 40% for residential users." },
        { title: "EV Purchase Subsidy", details: "Up to ₹1.5 lakh for eligible users." }
    ];
</script>

<div class="container">
    <h2>Government Subsidies</h2>
    <ul>
        {#each subsidies as subsidy}
            <li>
                <strong>{subsidy.title}</strong>: {subsidy.details}
            </li>
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
    li {
        margin: 1rem 0;
    }
</style>
