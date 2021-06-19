import { LightningElement, api, track, wire } from 'lwc';

export default class DisplayAccountInfo extends LightningElement {

    @api screenWidth = 'CLASSIC';

    @track _contacts = [];
    @api displayContacts = [];

    @api
    get contacts() {
        return this._contacts
    }
    set contacts(value) {
        this._contacts = value;
        this.displayContacts = value;
    }

    get tableClass() {
        if (this.screenWidth === 'MOBILE') {
            return 'mobileContainerDiv grid slds-table slds-table_cell-buffer slds-table_bordered full-table'
        }
        return 'classicContainerDiv slds-table slds-table_cell-buffer slds-table_bordered full-table'
    }

}