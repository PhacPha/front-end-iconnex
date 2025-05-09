document.addEventListener("DOMContentLoaded", function () {
  // Particle Canvas Logic
  const canvas = document.getElementById("particleCanvas");
  const mainContent = document.querySelector(".main-content");

  if (!canvas || !mainContent) {
    console.error("Particle Canvas or Main Content not found!");
  } else {
    const ctx = canvas.getContext("2d");
    if (!ctx) {
      console.error("Failed to get 2D context for canvas!");
    } else {
      function resizeCanvas() {
        canvas.width = mainContent.offsetWidth;
        canvas.height = mainContent.offsetHeight;
      }

      const particles = [];
      const mouse = { x: null, y: null, radius: 150 };

      class Particle {
        constructor(x, y, dx, dy, size) {
          this.x = x;
          this.y = y;
          this.dx = dx;
          this.dy = dy;
          this.size = size;
        }
        draw() {
          ctx.beginPath();
          ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
          ctx.fillStyle = "rgba(255, 255, 255, 0.8)";
          ctx.fill();
        }
        update() {
          if (this.x + this.size > canvas.width || this.x - this.size < 0)
            this.dx = -this.dx;
          if (this.y + this.size > canvas.height || this.y - this.size < 0)
            this.dy = -this.dy;
          this.x += this.dx;
          this.y += this.dy;
          this.draw();
        }
      }

      function init() {
        particles.length = 0;
        for (let i = 0; i < 55; i++) {
          let size = Math.random() * 3 + 1;
          let x = Math.random() * (canvas.width - size * 2) + size;
          let y = Math.random() * (canvas.height - size * 2) + size;
          let dx = (Math.random() - 0.5) * 1.2;
          let dy = (Math.random() - 0.5) * 1.2;
          particles.push(new Particle(x, y, dx, dy, size));
        }
      }

      function drawLines() {
        ctx.strokeStyle = "rgba(255, 255, 255, 0.2)";
        ctx.lineWidth = 1;
        for (let i = 0; i < particles.length; i++) {
          for (let j = i + 1; j < particles.length; j++) {
            let dx = particles[i].x - particles[j].x;
            let dy = particles[i].y - particles[j].y;
            let distance = Math.sqrt(dx * dx + dy * dy);
            if (distance < 150) {
              ctx.beginPath();
              ctx.moveTo(particles[i].x, particles[i].y);
              ctx.lineTo(particles[j].x, particles[j].y);
              ctx.stroke();
            }
          }
          if (mouse.x !== null && mouse.y !== null) {
            let dx = particles[i].x - mouse.x;
            let dy = particles[i].y - mouse.y;
            let distance = Math.sqrt(dx * dx + dy * dy);
            if (distance < mouse.radius) {
              ctx.beginPath();
              ctx.moveTo(particles[i].x, particles[i].y);
              ctx.lineTo(mouse.x, mouse.y);
              ctx.stroke();
            }
          }
        }
      }

      function animate() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        particles.forEach((particle) => particle.update());
        drawLines();
        requestAnimationFrame(animate);
      }

      const debounce = (func, wait) => {
        let timeout;
        return (...args) => {
          clearTimeout(timeout);
          timeout = setTimeout(() => func.apply(this, args), wait);
        };
      };

      window.addEventListener(
        "mousemove",
        debounce((event) => {
          const rect = canvas.getBoundingClientRect();
          mouse.x = event.clientX - rect.left;
          mouse.y = event.clientY - rect.top;
        }, 10)
      );

      window.addEventListener(
        "resize",
        debounce(() => {
          resizeCanvas();
          init();
        }, 100)
      );

      resizeCanvas();
      init();
      animate();
    }
  }

  // Intersection Observer
  const observerOptions = {
    root: null,
    rootMargin: "0px",
    threshold: 0.1,
  };

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add("is-visible");
        observer.unobserve(entry.target);
      }
    });
  }, observerOptions);

  const elementsToObserve = document.querySelectorAll(
    ".title, .portfolio-container, .block-section, .block-details-container"
  );

  if (elementsToObserve.length === 0) {
    console.warn("No elements found to observe!");
  } else {
    elementsToObserve.forEach((element) => observer.observe(element));
  }

  // Block Slider Logic
  const blockContainer = document.querySelector(".block-container");
  const blockItems = document.querySelectorAll(".block-item");
  const prevBtn = document.querySelector(".slider-btn.prev");
  const nextBtn = document.querySelector(".slider-btn.next");
  const progressFill = document.querySelector(".progress-fill");

  if (
    !blockContainer ||
    !blockItems.length ||
    !prevBtn ||
    !nextBtn ||
    !progressFill
  ) {
    console.error("Block Slider elements not found!");
  } else {
    let currentIndex = 0;
    const maxVisible = 5;
    const totalItems = blockItems.length;

    function updateSlider(direction) {
      blockItems.forEach((item) => {
        item.classList.remove("visible", "slide-in-left", "slide-in-right");
        item.style.display = "none";
      });

      const totalItems = blockItems.length;
      if (totalItems === 0) return;

      const startIndex = totalItems <= maxVisible ? 0 : currentIndex;
      const itemsToShow = Math.min(maxVisible, totalItems);

      for (let i = 0; i < itemsToShow; i++) {
        const index = (startIndex + i) % totalItems;
        const item = blockItems[index];
        if (item) {
          item.style.display = "flex";
          setTimeout(() => {
            item.classList.add("visible");
            if (direction === "prev") {
              item.classList.add("slide-in-left");
            } else if (direction === "next") {
              item.classList.add("slide-in-right");
            }
          }, 50);

          // Check if block-title is too long and add marquee effect
          const blockTitle = item.querySelector(".block-title");
          if (blockTitle) {
            blockTitle.classList.remove("long");
            const titleWidth = blockTitle.scrollWidth;
            const containerWidth = blockTitle.offsetWidth;
            if (titleWidth > containerWidth) {
              blockTitle.classList.add("long");
            }
          }

          // Check if block-details li is too long and add marquee effect
          const blockDetailsLis = item.querySelectorAll(".block-details li");
          if (blockDetailsLis) {
            blockDetailsLis.forEach((li) => {
              li.classList.remove("long");
              const liWidth = li.scrollWidth;
              const liContainerWidth = li.offsetWidth;
              if (liWidth > liContainerWidth) {
                li.classList.add("long");
              }
            });
          }
        }
      }

      const totalSteps =
        totalItems > maxVisible ? totalItems - maxVisible + 1 : 1;
      const progressWidth =
        totalItems > maxVisible ? (itemsToShow / totalItems) * 100 : 100;
      const stepSize =
        totalSteps > 1 ? (100 - progressWidth) / (totalSteps - 1) : 0;
      progressFill.style.width = `${progressWidth + currentIndex * stepSize}%`;
    }

    prevBtn.addEventListener("click", () => {
      currentIndex =
        currentIndex <= 0 ? totalItems - maxVisible : currentIndex - 1;
      updateSlider("prev");
    });

    nextBtn.addEventListener("click", () => {
      currentIndex =
        currentIndex >= totalItems - maxVisible ? 0 : currentIndex + 1;
      updateSlider("next");
    });

    // Block Details Logic
    const blockDetailsImg = document.getElementById("block-details-img");
    const blockDetailsTitle = document.getElementById("block-details-title");
    const blockDetailsDescription = document.getElementById(
      "block-details-description"
    );

    if (!blockDetailsImg || !blockDetailsTitle || !blockDetailsDescription) {
      console.error("Block Details elements not found!");
    } else {
      function updateBlockDetails(id) {
        const selectedItem = document.querySelector(
          `.block-item[data-id="${id}"]`
        );
        if (!selectedItem) {
          console.error(`Block item with id ${id} not found!`);
          return;
        }

        const imgSrc = selectedItem.querySelector(".block-image img").src;
        const title = selectedItem.querySelector(".block-title").textContent;
        const description =
          selectedItem.dataset.description || "ไม่มีรายละเอียดเพิ่มเติม";

        blockDetailsImg.style.opacity = 0;
        blockDetailsTitle.style.opacity = 0;
        blockDetailsDescription.style.opacity = 0;

        setTimeout(() => {
          blockDetailsImg.src = imgSrc;
          blockDetailsTitle.textContent = title;
          blockDetailsDescription.textContent = description;

          blockDetailsImg.style.transition = "opacity 0.5s ease";
          blockDetailsTitle.style.transition = "opacity 0.5s ease";
          blockDetailsDescription.style.transition = "opacity 0.5s ease";
          blockDetailsImg.style.opacity = 1;
          blockDetailsTitle.style.opacity = 1;
          blockDetailsDescription.style.opacity = 1;
        }, 300);
      }

      blockItems.forEach((item) => {
        item.addEventListener("click", () => {
          const id = item.getAttribute("data-id");
          updateBlockDetails(id);
        });
      });

      updateSlider();
      updateBlockDetails("1");
    }
  }
});