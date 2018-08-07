import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { setStickyFooter } from '../components/footer';

initUpdateNavbarOnScroll();

setStickyFooter();

let names = ["Product Management", "Growth Hacking", "Software Development", "Data Mining", "Data Science"];
loadDynamicBannerText(names);
