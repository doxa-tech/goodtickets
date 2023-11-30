<script>
  import { cartStore } from './cartStore.js';

  let cart;
  
  cartStore.subscribe((value) => {
		cart = value;
	});
</script>

{#each cart as item }
  <p>{ item }</p>
{/each}