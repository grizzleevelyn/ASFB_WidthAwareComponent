import { LightningElement, api, track, wire } from 'lwc';
import getAccountInfoWrapper from '@salesforce/apex/InterfaceClass.getAccountInfoWrapper';

export default class ContactParentComponent extends LightningElement {
    @api recordId;

    @track contacts = [];
    @track wiredContacts = [];
    error = '';

    screenWidth = 'CLASSIC';
    componentWidth;

	connectedCallback() {
		window.addEventListener('resize', this.resizeFunction);
	}

    @wire(getAccountInfoWrapper, {accountId : '$recordId'})
    getContacts(result) {
        this.wiredContacts = result;
        if(result.data) {
            this.contacts = JSON.parse(JSON.stringify(result.data.contactList));
            this.error = undefined;
            this.resizeFunction();
        }
        else if (result.error) {
            this.contacts = undefined;
            this.error = result.error.body.message;
            console.error(this.error);
        }
    }

    resizeFunction = () => {
		let component = this.template.querySelector('.displayContactTable');
		this.componentWidth = component.getBoundingClientRect().width;
		if(this.componentWidth < 600) {
			this.screenWidth = 'MOBILE';
		}
		else {
			this.screenWidth = 'CLASSIC';
		}
	}
}