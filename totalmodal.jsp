            <!-- Modal -->
          <div id="myModal" class=" modal hide fade" tabindex="-1" role="dialog" aria-labelledby="#myModalLabel" aria-hidden="true" style="display: block;">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h3 id="myModalLabel">회원사진, 회원아이디</h3>
            </div>
            <div class="modal-body">
              <div class="carousel slide myCarousel">
                <div class="carousel-inner">
                  <div class="active item">
                    <jsp:include page="modal.jsp"></jsp:include>
                  </div>
                  <div class="item">
                    <jsp:include page="modal.jsp"></jsp:include>
                    </div>
                  <div class="item">
                    <jsp:include page="modal.jsp"></jsp:include>
                  </div>
                </div>
                <!-- Carousel nav -->
                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
              </div>
            </div>
          </div>
          <jsp:include page="modal2.jsp"></jsp:include>