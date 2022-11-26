<script lang="ts">
	import { enhance } from "$app/forms";
</script>

<svelte:head>
	<title>Sign up - TooEater</title>
</svelte:head>

<div class="container">
	<h1>Create an account</h1>
	<form method="post" use:enhance>
		<label for="email">email</label>
		<input id="email" name="email" />
		<label for="handle">handle</label>
		<input id="handle" name="handle" />
		<label for="password">password</label>
		<input type="password" id="password" name="password" />
		<label for="name">name</label>
		<input id="name" name="name" />
		<label for="about">about you</label>
		<input id="about" name="about" />
		<label for="avatar">avatar URL</label>
		<input id="avatar" name="avatar" />
		<label for="banner">banner URL</label>
		<input id="banner" name="banner" />
    <input type="submit" value="Continue" class="btn" />
	</form>
</div>

<style>
  .container {
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

	h1 {
		top: 0;
		padding: var(--spacing-8) var(--spacing-24);
		font-size: var(--font-18);
		backdrop-filter: blur(100px);
	}

  form {
    display: flex;
    flex-direction: column;
    background-color: var(--color-bg-primary);
		padding: var(--spacing-8) var(--spacing-24);
  }

  label {
    margin-top: 2px;
    margin-bottom: 2px;
    font-size: var(--font-16);
  }

	input {
		color: var(--color-text-primary);
		background-color: var(--color-bg-secondary);
    padding: 1.2rem;
	}

  .btn {
    margin-top: 10px;
  }
</style>
