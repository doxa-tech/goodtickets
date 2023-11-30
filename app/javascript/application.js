import SvelteAdapter from "./SvelteAdapter";

// Components
import Item from "./components/orders/Item.svelte";
import Cart from "./components/orders/Cart.svelte"

// Search and mount Svelte components

const adapter = new SvelteAdapter();

adapter.register(Item, "orders");
adapter.register(Cart, "orders");

adapter.mountComponents(document, "svelte-component");
