<script lang='ts'>
	import { page } from "$app/stores";
	import { handleSession } from "@lucia-auth/sveltekit/client";

	import '../app.postcss';
	import '$root/styles/global.css'

	handleSession(page);
</script>

<slot />
