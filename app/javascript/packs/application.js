import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { setStickyFooter } from '../components/footer';
import { autocomplete } from '../components/autocomplete';

console.log('webpacker');
autocomplete();

initUpdateNavbarOnScroll();

setStickyFooter();

let names = ["Product Management", "Growth Hacking", "Software Development", "Data Mining", "Data Science"];

loadDynamicBannerText(names);
console.log("rizaparmesão");

