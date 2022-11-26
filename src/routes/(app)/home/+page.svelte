<script lang="ts">
  import type { PageData } from "./$types";

  import Compose from '$root/components/compose.svelte';
  import Tooeat from '$root/components/tooeat.svelte'
  import type { TooeatType } from '$root/types'

  export let data: PageData;
  let tooeats: TooeatType[] = data.tooeats || [];
</script>

<svelte:head>
  <title>Home - TooEater</title>
</svelte:head>

<Compose/>

<h1>Feed</h1>

{#each tooeats as tooeat (tooeat.id)}
  <Tooeat {tooeat} />
{/each}

<style>
  h1 {
    position: sticky;
    top: 0;
    padding: var(--spacing-8) var(--spacing-24);
    font-size: var(--font-24);
    backdrop-filter: blur(100px);
  }
</style>
