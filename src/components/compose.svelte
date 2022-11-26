<script lang="ts">
  import { getUser } from "@lucia-auth/sveltekit/client";

	import { enhance } from '$root/lib/form'

  const user = getUser();
	const maxCharacters = 280
	let tooeat = ''

	$: charactersLeft = maxCharacters - tooeat.length
</script>

<div class="compose">
	<img src={$user?.avatar} alt="Avatar" />
	<form
    action="/home?/createTooeat"
    method="POST"
    autocomplete="off"
    use:enhance={{ result: ({ form }) => form.reset() }}
  >
		<input
			aria-label="Enter your Too-eat"
			bind:value={tooeat}
			name="tooeat"
			placeholder="How you doin'?"
			type="text"
		/>
		<button
			class="btn"
			class:error={charactersLeft < 0}
			disabled={charactersLeft <= 0}
			type="submit"
		>
			{charactersLeft === maxCharacters
				? 'Too-eat'
				: charactersLeft}
		</button>
	</form>
</div>

<style>
	.compose {
		display: grid;
		grid-template-columns: min-content 1fr;
		align-items: center;
		gap: var(--spacing-16);
		padding: var(--spacing-16) var(--spacing-24);
		border-bottom: 1px solid var(--color-border-primary);
	}

	img {
		width: 48px;
		height: 48px;
    min-width: 48px;
		border-radius: 50%;
	}

	form {
		display: flex;
		align-items: center;
    justify-content: space-between;
		gap: var(--spacing-16);
	}

	input {
		color: var(--color-text-primary);
		background-color: transparent;
    padding: 1.2rem;
	}

	button {
		min-width: 100px;
		font-size: var(--font-16);
		padding: var(--spacing-16);
	}

	.error {
		color: tomato;
	}
</style>
