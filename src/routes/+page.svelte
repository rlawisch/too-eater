<script lang="ts">
	import { fly } from 'svelte/transition'
</script>

<svelte:head>
	<title>Too-eater</title>
</svelte:head>

<main
	class="container"
	in:fly={{ x: -100, duration: 250, delay: 300 }}
	out:fly={{ x: -100, duration: 250 }}
>
	<section class="hero">
		<h1 class="title">Too-eater 🍕</h1>
		<p class="text">A place for foodies</p>
	</section>

	<section class="login">
		<a class="btn" href="/login">🍔 Log in to share your plate</a>
		<a class="btn" href="/signup">🍟 Join the community</a>
	</section>
</main>

<style>
	.container {
		height: 100vh;
		display: grid;
	}

	.hero,
	.login {
		display: grid;
		place-content: center;
	}

	.hero {
		background-color: var(--color-brand);
		text-align: center;
	}

	.title {
		font-size: var(--font-80);
		z-index: 2;
	}

	.text {
		padding: var(--spacing-16);
		transform: rotate(2deg) translateY(-40%);
		background: var(--color-bg-primary);
		font-weight: bold;
		font-size: var(--font-24);
		z-index: 1;
	}

	@media (min-width: 1024px) {
		.container {
			grid-template-columns: repeat(2, 1fr);
		}
	}
</style>
