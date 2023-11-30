<script>
  import ItemForm from './ItemForm.svelte';

  export let name;
  let showModal = false;
</script>

<div class="item">
  <p>
    { name }
  </p>
  <button on:click={() => showModal = true}>Add</button>
</div>

{#key showModal}
<ItemForm bind:showModal name={name} />
{/key}