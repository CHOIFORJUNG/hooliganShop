$(data.reList).each(function(){
	 			str +='<div class="row mt">'
					+ 	'<div class="col-lg-8" style="text-align: center; width: 100%">'
					+		'<div class="content-panel" style="display: inline-block; width: 1000px;">'
					+			'<section id="unseen">'
					+				'<table class="table table-bordered table-striped table-condensed">'
					+					'<thead>'
					+						'<tr>'
					+							"<li data-rebnum='"+ this.rebnum +"' class='reList'>"
					+							'<th style="width: 170px; text-align: center;">'+  this.userId + '</th>'
					+							'<th style="width: 170px; text-align: center;">'+ this.regdate +'</th>'
					+							'<th style="text-align: center;">'+ this.reContent+'&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifyDiv">수정</button>'+'</th>'
					+							"</li>"
					+						'</tr>'
					+					'</thead>'
					+				'</table>'
					+			'</section>'
					+		'</div>'
					+	'</div>'
					+'</div>';
					
<div class="modal fade" id="modifyDiv">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">
							<span class='title-dialog'></span>번 댓글 편집창
						</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!--   Modal body -->
					<div class="modal-body">
						<input type="text" id="userId" size="8" readonly="readonly">
					</div>
					<div class="modal-body">
						<input type="text" id="regdate" size="15" readonly="readonly">
					</div>
					<div class="modal-body">
						<input type="text" id="reContent" size="60" name="reContent">
					</div>
					<div align="center">
						<button type="button" id="reModifyBtn">수정</button>
						<button type="button" id="reDelBtn">삭제</button>
					</div>
					<!--    Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>

				</div>
			</div>
		</div>