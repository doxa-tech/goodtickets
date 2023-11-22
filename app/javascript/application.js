
// Search and replace Svelte components
document.querySelectorAll(".svelte-component").forEach(target => {
  // each data-[attribute] is passed to the component
  const props = {};
  target.getAttributeNames().forEach(name => {
    if (name.startsWith("data-")) {
      props[name.replace("data-", "")] = target.getAttribute(name);
    }
  });
  importSvelteComponent(props['component']).then(module => {
    const App = module.default;
    new App({
      target: target,
      props: props,
    });
  }).catch(error => {
    target.innerHTML = error;
  });
});

// Import dynamically a Svelte component located at the given `url`.
// `url` contains at most 2 levels, e.g. /folder/subfolder/my_component
function importSvelteComponent(url) {
  const tree = url .split("/");
  switch (tree.length) {
    case 1: return import(`./components/${tree[0]}.svelte`);
    case 2: return import(`./components/${tree[0]}/${tree[1]}.svelte`);
    case 3: return import(`./components/${tree[0]}/${tree[1]}/${tree[2]}.svelte`);
    default:
      return Promise.reject(new Error('The path must contains at most two subdirectories.'));
  }
}