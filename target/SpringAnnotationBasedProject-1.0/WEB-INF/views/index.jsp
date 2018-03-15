<%@include file="../shared/header.jsp"%>
<div class="row">
    <div class="col-md-12">
        <h1 style="font-family: Microsoft JhengHei UI Light;font-size:60px">Supplier SPA</h1>
        <div class="table-responsive">
            <div class="pull-right">
                <span class="add-btn" data-toggle="tooltip" title="Add Suppliers"><button class="btn btn-xs" style="background-color: #7DB772;color:white"><span class="glyphicon glyphicon-plus-sign"></span> Add Suppliers</button></span>
                <span class="mail-btn" data-toggle="tooltip" title="Mail a Supplier"><button class="btn btn-xs" style="background-color: #7DB772;color:white"><span class="glyphicon glyphicon-envelope"></span> Email Suppliers</button></span>
                <span class="mailHistoryView" data-toggle="tooltip" title="View Mail Logs"><button class="btn  btn-xs" style="background-color: #7DB772;color:white"><span class="glyphicon glyphicon-inbox"></span> Mail Logs</button></span>
            </div><br><br>
            <table id="mytable" class="table table-borderd table-striped table-hover">

                <tr class="success">
                    <th>#</th>
                    <th>Name</th>
                    <th style="text-align: center">Contact</th>
                    <th style="text-align: center">Email</th>
                    <th style="text-align: center">Status</th>
                    <th style="text-align: center">Action</th>
                </tr>
                <tbody>
                    <c:forEach var="supplier" items="${suppliers}">
                        <tr data-id="${supplier.id}">
                            <td data-title="sid">${supplier.id}</td>
                            <td data-title="sname">${supplier.name}</td>
                            <td data-title="scontact" style="text-align: center">${supplier.contact}</td>
                            <td data-title="semail" style="text-align: center"><span class="mail-btn" data-supplier-email="${supplier.email}" data-id="${supplier.id}" data-toggle="tooltip" title="Click to send Email"><button class="btn btn-outline-secondary btn-xs">${supplier.email} <span class="glyphicon glyphicon-send"></span></button></span></td>

                            <td data-title="sstatus" style="text-align: center">
                                <c:choose>
                                    <c:when test="${supplier.status}">
                                        <label class="label" style="background-color: #7DB772;color:white">Active</label>
                                    </c:when>
                                    <c:otherwise>
                                        <label class="label" style="background-color: #E77471;color:white">Inactive</label>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td style="text-align: center">
                                <span class="edit-btn" data-edit-id="${supplier.id}" data-supplier-name="${supplier.name}" data-supplier-contact="${supplier.contact}" data-supplier-email="${supplier.email}" data-supplier-status="${supplier.status}" data-toggle="tooltip" title="Edit">
                                    <button class="btn btn-xs" style="background-color: #7DB772;color:white" data-title="Edit" data-toggle="modal" data-target="#edit" >
                                        <span class="glyphicon glyphicon-pencil"></span>
                                    </button></span>
                                <span class="delete-btn" data-delete-id="${supplier.id}" data-placement="top" data-toggle="tooltip" title="Delete">
                                    <button class="btn btn-xs" style="background-color: #E77471;color:white" data-title="Delete" data-toggle="modal" data-target="#delete" >
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </button>
                                </span>
                            </td>
                        </tr>
                    </c:forEach>  
                </tbody>

            </table>
            <!--Pagination Division-->
            <div class="clearfix"></div>
            <ul class="pagination pull-right">
                <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            </ul>

        </div>

    </div>
</div>

<!--Edit Supplier Modal-->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Edit Supplier Info</h4>
            </div>

            <form id="supplier-info-edit" method = "POST" action = "${pageContext.request.contextPath}/editSupplier">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Supplier's Name</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control " id="editSupplierName" type="text" name="name" data-title="sname"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Supplier's Contact Number</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input class="form-control " type="text" name="contact" id="editSupplierContact" data-title="scontact"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Supplier's Email Address</label>
                        <div class="input-group">
                            <span class="input-group-addon"><b>@</b></span>
                            <input class="form-control " type="text" name="email" id="editSupplierEmail" data-title="semail"/>
                        </div>
                    </div>
                    <div class="form-inline">
                        <label>Status</label>
                        <input class="form-control " type="checkbox" name="status" id="editSupplierStatus" data-title="sstatus"/>
                    </div>
                </div>
                <div class="modal-footer ">
                    <input type="hidden" id="editSupplierId" name="id" value="" data-title="sid" data-id="">
                    <button id="edit-save-btn" type="submit" class="btn btn-success btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Delete Supplier Modal-->
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this supplier's records?</div>

            </div>
            <div class="modal-footer ">
                <form method ="post" action="${pageContext.request.contextPath}/deleteSupplier">
                    <input type="hidden" id="deleteSupplierId" name="did" value=""/>
                    <button type="submit" class="btn btn-danger" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                    <button class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
                </form>
            </div>
        </div> 
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Mail Modal -->
<div class="modal fade" id="mail" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Send Email to </h4>
            </div>

            <form id="mailForm" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label>To</label>
                        <div class="input-group">
                            <span class="input-group-addon"><b>@</b></span>
                            <input class="form-control " id="mail-to" type="text" name="to" placeholder="example@example.com" value=""/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Select a Template </label><label class="pull-right"><i style="color:gray">(Optional)</i></label>
                        <select name="mailTemplates" class="form-control">
                            <option value="">Place Orders</option>
                            <option value="">Cancel Order</option>
                            <option value="">Request Information</option>
                            <option value="" disabled selected>-- Select a Mail Template --</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Subject</label>
                        <input class="form-control " type="text" name="subject" placeholder="Subject of your email"/>
                    </div>
                    <div class="form-group">
                        <textarea rows="12" class="form-control" placeholder="Write here..."></textarea>
                    </div>
                    <div class="form-inline">
                        <input type="checkbox" name="sendToMe"/> <label>Send a Copy of this Email to Me</label>
                    </div>
                </div>

                <div class="modal-footer ">
                    <input type="hidden" id="mail-supplier-id" name="supplierId" value="">
                    <button id="update-btn" type="submit" class="btn btn-success btn-lg" style="width: 100%;">Send  <span class="glyphicon glyphicon-send"></span></button>
                </div>

            </form>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Add Product Modal-->
<div class="modal fade" id="addProduct" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Add Product for </h4>
            </div>

            <form id="addProductForm">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Product Name</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-gift"></span></span>
                            <input class="form-control " type="text" name="pname" placeholder="Product's Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Product Description</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-tag"></span></span>
                            <input class="form-control " type="text" name="pdescription" placeholder="Product's Description"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Price</label>
                        <div class="input-group">
                            <span class="input-group-addon">&nbsp;&nbsp;&#8377;&nbsp;&nbsp;&nbsp;</span>
                            <input class="form-control " type="text" name="pprice" placeholder="Price"/>
                            <span class="input-group-addon">.00/-</span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Quantity</label>
                        <div class="input-group">
                            <span class="input-group-addon">Qty:</span>
                            <input class="form-control " type="text" name="pqty" placeholder="Quantity"/>
                        </div>
                    </div>
                    <input type="hidden"> <!--ENTER SUPPLIER ID HERE-->
                    <div class="form-inline">
                        <input class="form-control" type="checkbox" name="status" checked="checked" style="display:none"/>
                    </div>
                </div>
                <div class="modal-footer ">
                    <input type="hidden" id="supplier-id" value="">
                    <button type="button" class="btn btn-danger btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-plus"></span> Add</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Add Suppliers Modal-->
<div class="modal fade" id="addSupplier">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Add Suppliers</h4>
            </div>

            <form id="supplier-info-edit" method = "POST" action = "${pageContext.request.contextPath}/addSupplier">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Supplier's Name</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input class="form-control " name="name" id="addSupplierName" type="text" placeholder="Supplier Name"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Supplier's Contact Number</label>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                            <input class="form-control " name="contact" type="text" id="addSupplierContact" placeholder="Contact Number"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Supplier's Email Address</label>
                        <div class="input-group">
                            <span class="input-group-addon"><b>@</b></span>
                            <input class="form-control " name="email" type="text"  id="addSupplierEmail" placeholder="Email Address"/>
                        </div>
                    </div>
                    <div class="form-inline">
                        <label>Status</label>
                        <input class="form-control" name="status" type="checkbox" id="addSupplierStatus"/>
                    </div>
                </div>
                <div class="modal-footer ">
                    <input type="hidden" id="addSupplierId" value="">
                    <button id="add-supplier-btn" type="submit" class="btn btn-success btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-plus-sign"></span> Add</button>
                </div>
            </form>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Mail View History Modal-->
<div class="modal fade" id="mailHistoryView" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Mail Logs</h4>
            </div>

            <div class="modal-body">
                <table class="table table-bordred table-striped">
                    <tr>
                        <th>Sent To</th>
                        <th>Subject</th>
                        <th>Sent Date</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <td>Sahaj Amatya</td>
                        <td>Temporary</td>
                        <td>06:12:45 NST; 2018-01-24</td>
                        <td><button class="btn btn-primary btn-xs btn-success"><span class="glyphicon glyphicon-repeat"></span> Resend</button>
                            <span class="deleteMail"><button class="btn btn-primary btn-xs btn-danger"><span class="glyphicon glyphicon-trash"></span> Remove</button></span></td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Delete Mail Log-->
<div class="modal fade" id="deleteMail" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
            </div>
            <div class="modal-body">

                <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this log?</div>

            </div>
            <div class="modal-footer ">
                <button type="button" class="btn btn-danger" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
                <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
            </div>
        </div>
        <!-- /.modal-content --> 
    </div>
    <!-- /.modal-dialog --> 
</div>
<!--Script-->
<script>
    $(document).ready(function () {
        $("#mytable #checkall").click(function () {
            if ($("#mytable #checkall").is(':checked')) {
                $("#mytable input[type=checkbox]").each(function () {
                    $(this).prop("checked", true);
                });

            } else {
                $("#mytable input[type=checkbox]").each(function () {
                    $(this).prop("checked", false);
                });
            }
        });
        $("[data-toggle=tooltip]").tooltip();

        $(".edit-btn").on('click', function () {
            var $this = $(this);
            var $checkboxVal; 
            if ($this.attr('data-supplier-status') === "true") {
                $checkboxVal = true;
            } else {
                $checkboxVal = false;
            }
            $("#editSupplierId").val($this.attr('data-edit-id'));
            $("#editSupplierName").val($this.attr('data-supplier-name'));
            $("#editSupplierContact").val($this.attr('data-supplier-contact'));
            $("#editSupplierEmail").val($this.attr('data-supplier-email'));
            $("#editSupplierStatus").prop('checked', $checkboxVal);
            $('input[id="editSupplierId"]').attr('data-id', $this.attr('data-edit-id'));
        });

        $(".delete-btn").on('click', function () {
            var $this = $(this);
            $('input[id="deleteSupplierId"]').attr('value', $this.attr('data-delete-id'));
        });
        
        $(".mail-btn").on('click', function () {
            var $this = $(this);
            $("#mail-to").val($this.attr('data-supplier-email'));
            $("#mail-supplier-id").val($this.attr('data-id'));
            $("#mail").modal('show');
        });
        $(".addProduct").on('click', function () {
            $("#addProduct").modal('show');
        });
        $(".add-btn").on('click', function () {
            $("#addSupplier").modal('show');
        });
        $(".mailHistoryView").on('click', function () {
            $("#mailHistoryView").modal('show');
        });
        $(".deleteMail").on('click', function () {
            $("#deleteMail").modal('show');
        });
    });


</script>
<%@include file="../shared/footer.jsp"%>