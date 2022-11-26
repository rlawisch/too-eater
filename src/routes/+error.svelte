<script>
  import { page } from '$app/stores';
</script>

<div class="error">
	<h1>{$page.status}: {$page.error?.message}</h1>
	<img
		src="/oops.gif"
		alt="Oops monkey"
	/>
</div>

<style>
	.error {
		height: 100vh;
		display: grid;
		gap: var(--spacing-32);
		place-content: center;
		place-items: center;
	}

	img {
		width: 300px;
		height: 400px;
		border-radius: 10%;
		object-fit: cover;
	}
</style>
