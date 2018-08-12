import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { loadDynamicBannerText } from '../components/banner';
import { setStickyFooter } from '../components/footer';
import { autocomplete } from '../components/autocomplete';
import { setCalendar } from '../components/calendar';

console.log("hello from webpacker");

setCalendar();

autocomplete();

initUpdateNavbarOnScroll();

setStickyFooter();

let names = ["Test Management", "Growth Hacking", "Software Development", "Data Mining", "Data Science"];

loadDynamicBannerText(names);
