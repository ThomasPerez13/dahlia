<ul>
  <% @consultations.each do |consultation| %>
    <li><%= consultation.first_name %></li>
    <li><%= consultation.last_name %></li>
    <li><%= consultation.address %></li>
    # <% consultation.treatments  do |treatment| %>
    #   <% treatment.category %>
    # <% end %>
  <% end %>
</ul>
