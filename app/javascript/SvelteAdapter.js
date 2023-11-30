/**
 * Handle registration and mounting of 
 * Svelte components in the Rails view.
 */
export default class SvelteAdapter {

  components = {};

  /**
   * Register a Svelte component, which can be then mounted
   * The component's name is the filename
   * @param {SvelteComponent} module 
   * @param {String} namespace component's namespace, e.g. admin/orders
   */
  register(module, namespace="") {
    this.components[`${namespace}/${module.name}`] = module;
  }

  /**
   * Search in the `target` container elements with `className` and
   * then mount the appropriate component, identified by an HTML attribute.
   * @param {Element} target the HTML container to scan for components
   * @param {String} className the class name of the compoment's HTML element
   */
  mountComponents(target, className) {
    // Search and replace Svelte components
    target.querySelectorAll("." + className).forEach(el => {
      // each data-[attribute] is passed to the component
      const props = {};
      el.getAttributeNames().forEach(name => {
        if (name.startsWith("data-")) {
          props[name.replace("data-", "")] = el.getAttribute(name);
        }
      });

      const componentName = props["component"];
      const module = this.components[componentName];

      if (module === undefined) {
        el.innerHTML = "Module not found: " + componentName;
      } else {
        new module({
          target: el,
          props: props,
        });
      }
    });
  }
  
}
