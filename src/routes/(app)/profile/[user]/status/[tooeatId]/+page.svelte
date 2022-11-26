<script lang="ts">
  import type { PageData } from './$types';
	import Tooeat from '$root/components/tooeat.svelte'

	export let data: PageData;
  let tooeat = data.tooeat;

	const name = tooeat?.name
	const content = tooeat?.content.slice(0, 60)
</script>

<svelte:head>
	<title>{name} on Too-eater: "{content}..."</title>
</svelte:head>

<Tooeat {tooeat} />
