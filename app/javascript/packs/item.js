export function addItemFields() {
    // Create date object
    var date = new Date();

    // get number of milliseconds since epoch and use it for address key
    var msec = date.getTime();

    // Replace 0 with milliseconds
    idAttributeName =  "rfq_items_attributes_0_name".replace("0", msec);
    nameAttributeName = "rfq[items_attributes][0][name]".replace("0", msec);
    
    idAttributeDescription = "rfq_items_attributes_0_description".replace("0", msec);
    nameAttributeDescription = "rfq[items_attributes][0][description]".replace("0", msec);

    idAttributeLength = "rfq_items_attributes_0_length".replace("0", msec);
    nameAttributeLength = "rfq[items_attributes][0][length]".replace("0", msec);
    
    idAttributeWidth = "rfq_items_attributes_0_width".replace("0", msec);
    nameAttributeWidth = "rfq[items_attributes][0][width]".replace("0", msec);
    
    idAttributeHeight = "rfq_items_attributes_0_height".replace("0", msec);
    nameAttributeHeight = "rfq[items_attributes][0][height]".replace("0", msec);

    idAttributeSpecialConditions = "rfq_items_attributes_0_special_conditions".replace("0", msec);
    nameAttributeSpecialConditions = "rfq[items_attributes][0][special_conditions]".replace("0", msec);

    // Create <p> tag
    var p = document.createElement("p");

    // Create label for name, set it's attribute, and append it to <p> element
    var labelName = document.createElement("label");
    labelName.setAttribute("for", idAttributeName);
    var nameLabelText = document.createTextNode("Name");
    labelName.appendChild(nameLabelText);
    p.appendChild(labelName);

    // Create input for name, set it's attribute, and append it to <p> element
    var inputName = document.createElement("INPUT");
    inputName.setAttribute("type", "text");
    inputName.setAttribute("id", idAttributeName);
    inputName.setAttribute("name", nameAttributeName);
    p.appendChild(inputName);

    // Repeat for other attributes
    var t = document.createElement("label");
    t.appendChild(document.createTetxtNode("NODE"));
    document.getElementById("itemsList").appendChild(t);

    // add <p> element with its child elements
    document.getElementById("itemsList").appendChild(p);

    // Show items header
    $("#itemsHeader").show();

    // https://jyrkis-blogs.blogspot.com/2014/06/adding-fields-on-fly-with-ruby-on-rails.html#code3Div

}