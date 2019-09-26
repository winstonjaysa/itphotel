<section>
		<div class="card-1">
			<h3>Requested Rides</h3>
			
			<div class="searchbox-table">
				<input class="form-control" id="myInput" type="text" placeholder="Search..">
			</div>
			
			<table style="text-align: center;" id="t1">
				<tr>
					<th>Travel Id</th>
					<th>User id</th>
					<th>User name</th>
					<th>Destination</th>
					<th>Arranged date</th>
					<th>Cost</th>
					<th>Status</th>
					<th>Status</th>
					<th></th>
				</tr>
				<%
				List<TransManageBeans> travelList=dao.getAllTravel();
			for(TransManageBeans travel:travelList){
		%>
				<tr>
					<td><%=travel.getTid() %></td>
					<td><%=travel.getUid() %></td>
					<td><%=travel.getUname() %></td>
					<td><%=travel.getDestination() %></td>
					<td><%=travel.getNeedDate() %></td>
					<td><%=travel.getCost() %></td>
					<td><%=travel.getIsApproved() %></td>
					<%
						if (travel.getIsApproved() == 1) {
					%>
						<td class="success-td">Confirmed</td>
						<td>
							<div class="dropdown">
	  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				  					<i class="fa fa-ellipsis-v" ></i>
				  				</span>
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								    <button type="button" class="btn dropdown-item" disabled="disabled"><a href="TransManageHandler?action=confirm&edit=conf&tid=<%=travel.getTid()%>">Confirm</a></button>
								  	<button type="button" class="btn dropdown-item" data-toggle="modal" data-target="#MesssgeDialogBox" data-whatever="<%=travel.getTid()%>">Message</button>
								  </div>
							</div>
						</td>
						
						
					<%
						}else if (travel.getIsApproved() == 2) {
							
					%>		
						<td class="warning-td">Deny</td>
						<!--  <td><a href="TransManageHandler?action=confirm&edit=conf&tid=<%=travel.getTid()%>">Confirm</a></td> -->
						<td>
							<div class="dropdown">
	  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				  					<i class="fa fa-ellipsis-v" ></i>
				  				</span>
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								    <button type="button" class="btn dropdown-item"><a href="TransManageHandler?action=confirm&edit=conf&tid=<%=travel.getTid()%>">Confirm</a></button>
								    <button type="button" class="btn dropdown-item" data-toggle="modal" data-target="#MesssgeDialogBox<%=travel.getTid()%>" data-whatever="<%=travel.getTid()%>">Message</button>
								  </div>
							</div>
						</td>
						
						<div class="modal fade" id="MesssgeDialogBox<%=travel.getTid()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" > 
							  
							  <div class="modal-dialog" role="document">
							    <div class="modal-content">
							   	<div class="modal-header">
							        <h5 class="modal-title" id="exampleModalLabel">Change</h5>
							       
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true">&times;</span>
							        </button>
		    				    </div>
		    		 		   	<form action="TransManageHandler?action=sendMessage&tid=<%=travel.getTid()%>&uid=<%=travel.getUid()%>" method="post">
										<div class="form_body">
											<div class="form-group">
												<input type="hidden" value="admin-travel.jsp" name="lastUrl">
												<label>message</label>
												<textarea name="messageA" placeholder="send message to user"></textarea>
										   <!-- <textarea name="messageU" placeholder="send message to admin"></textarea>  -->
												<button type="submit">Send</button>
											</div>
										</div>
										<div class="messageListDiv" id="d1">
											 <div class="messageListDiv_body " id="msList">
												<%
												List<TransManageBeans> msDisplay=dao.getUserTravelMessageList(travel.getTid());
													for(TransManageBeans ms:msDisplay){
												
												if ((ms.getUserMessage()==null || ms.getUserMessage().isEmpty()) && (!ms.getAdminMessage().isEmpty() || ms.getAdminMessage()!=null)){
												%>	
													<div class="form-group ">
														<div class="divclass2">
														 	 <p><%=ms.getAdminMessage() %></p> 
														</div>
													 </div>
												<%
													}else if((ms.getAdminMessage()==null || ms.getAdminMessage().isEmpty()) && (!ms.getUserMessage().isEmpty() || ms.getUserMessage()!=null)){
												%>
													<div class="form-group ">
														<div class="divclass1">
													 		<p><%=ms.getUserMessage() %></p>
														</div>
													 </div>
												<% 
													
												} }
												%>
											</div>
										</div>	
								</form>
								</div> 
							  </div>
						</div>
					<%
						} else {
							
					%>
						<td class="pending-td">Pending</td>
						<td>
							<div class="dropdown">
	  							<span class="drop_menu" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				  					<i class="fa fa-ellipsis-v" ></i>
				  				</span>
								  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
								    <a href="TransManageHandler?action=confirm&edit=conf&tid=<%=travel.getTid()%>"><button type="button" class="btn dropdown-item">Confirm</button></a>
								    <a href="TransManageHandler?action=confirm&edit=deny&tid=<%=travel.getTid()%>"><button type="button" class="btn dropdown-item">Deny</button></a>
								    <button type="button" class="btn dropdown-item" data-toggle="modal" data-target="#MesssgeDialogBox<%=travel.getTid()%>" data-whatever="<%=travel.getTid()%>">Message</button>
								  </div>
								  
							</div>
						
						<!-- <td><a href="TransManageHandler?action=confirm&edit=conf&tid=<%=travel.getTid()%>">Confirm</a></td>
						<td><a href="TransManageHandler?action=confirm&edit=deny&tid=<%=travel.getTid()%>">Deny</a></td> -->
					
					<%
						}
					%>
						
						
				</tr>
					
				<%
					}
				%>		
			</table>
			
		</div>
	</section>