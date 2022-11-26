<script context="module" lang="ts">
	import { dev } from '$app/environment'

	// load JavaScript in development for hot module replacement
	export const hydrate = dev

	// prerender static page in production
	export const prerender = true
</script>

<svelte:head>
	<title>About - TooEater</title>
</svelte:head>

<div class="container">
	<h1>About</h1>
	<div class="content">
		<p>
			This is an awesome project made real quick (I know you can notice that) by Rafael Lawisch and Leonardo Silva Dutra as the final Database for Engineers coursework (Computer Engineering, Universidade do Vale do Rio dos Sinos - UNISINOS).
		</p>
	</div>
</div>

<style>
	h1 {
		font-size: var(--font-24);
	}

	p {
		color: var(--color-text-muted);
	}

	.container {
		display: grid;
		gap: var(--spacing-8);
		padding: var(--spacing-16);
	}

	.content {
		display: grid;
		gap: var(--spacing-16);
	}
</style>
