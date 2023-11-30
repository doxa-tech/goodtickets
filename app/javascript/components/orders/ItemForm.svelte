<script>
  import { cartStore } from './cartStore.js';

  export let showModal, name;
  let dialog, validationErrors;
  let showSuccess = false;

  $: if (dialog && showModal) dialog.showModal();
  $: if (dialog && !showModal) dialog.close();

  function getForm(container) {
    fetch("/orders/get_form").then(response => {
      if (!response.ok) {
        return "Une erreur est survenue !";
      }
      return response.text();
    }).then(html => {
      container.innerHTML = html;
    });
  }

  function addItem() {
    fetch("/orders/add_item").then(response => {
      if (!response.ok) {
        return "Une erreur est survenue !";
      }
      return response.text();
    }).then(html => {
      if (html == "") { // no (validation) error
        cartStore.update((cart) => [...cart, name]);
        showSuccess = true;
        setTimeout(() => {
          showModal = false;
        }, 2000);
      } else {
        validationErrors.innerHTML = html;
      }
    });
  }
</script>

<!-- svelte-ignore a11y-click-events-have-key-events a11y-no-noninteractive-element-interactions -->
<dialog bind:this={dialog} on:click|self={() => showModal = false} on:close={() => showModal = false}>
  <!-- svelte-ignore a11y-no-static-element-interactions -->
  <div on:click|stopPropagation>
    {#if !showSuccess}
    <div bind:this={validationErrors}></div>
    <div use:getForm></div>
    <button on:click={addItem}>Ajouter</button>
    {:else}
    <div>Ajouté !</div>
    {/if}
  </div>
</dialog>

<style>
	dialog {
		border-radius: 0.2em;
		border: none;
		padding: 0;
	}
	
	dialog > div {
		padding: 1em;
	}
</style>
