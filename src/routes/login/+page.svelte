<script lang="ts">
  import { enhance } from "$app/forms";
</script>

<svelte:head>
	<title>Sign in - TooEater</title>
</svelte:head>

<div class="container">
  <h1>Sign in</h1>
  <form method="post" use:enhance>
    <label for="handle">handle</label>
    <input id="handle" name="handle" />
    <label for="password">password</label>
    <input type="password" id="password" name="password" />
    <div>
      <input type="submit" value="Continue" class="btn" />
    </div>
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
