# Directory Structure

```
.agents/
  skills/
    agent-skill-creator/
      references/
        blueprint.md (68 lines)
        file-layout.md (40 lines)
        quality-checklist.md (46 lines)
      SKILL.md (53 lines)
    skill-creator/
      agents/
        analyzer.md (274 lines)
        comparator.md (202 lines)
        grader.md (223 lines)
      assets/
        eval_review.html (146 lines)
      eval-viewer/
        generate_review.py (471 lines)
        viewer.html (1325 lines)
      references/
        schemas.md (430 lines)
      scripts/
        __init__.py (0 lines)
        aggregate_benchmark.py (401 lines)
        generate_report.py (326 lines)
        improve_description.py (247 lines)
        package_skill.py (136 lines)
        quick_validate.py (103 lines)
        run_eval.py (310 lines)
        run_loop.py (328 lines)
        utils.py (47 lines)
      LICENSE.txt (201 lines)
      SKILL.md (485 lines)
    skills-cli/
      references/
        commands.md (87 lines)
        semantics.md (34 lines)
      SKILL.md (134 lines)
      STORY.md (17 lines)
    write-a-skill/
      SKILL.md (117 lines)
.claude/
  handoffs/
    2026-06-11-184800-skills-monorepo-setup.md (77 lines)
    2026-06-12-014337-skills-monorepo-setup.md (146 lines)
    2026-06-12-022619-skill-analyzer-agent-setup.md (156 lines)
scripts/
  gen-index.sh (93 lines)
  link-to.sh (49 lines)
  scaffold.sh (33 lines)
skills/
  _custom/
    skills-monorepo-setup/
      scripts/
        gen-index.sh (88 lines)
        link-to.sh (39 lines)
        scaffold.sh (33 lines)
      REFERENCE.md (119 lines)
      SKILL.md (146 lines)
  diagnose/
    scripts/
      hitl-loop.template.sh (41 lines)
    SKILL.md (117 lines)
  find-skills/
    SKILL.md (142 lines)
  folder-inventory/
    SKILL.md (135 lines)
  grill-with-docs/
    ADR-FORMAT.md (47 lines)
    CONTEXT-FORMAT.md (77 lines)
    SKILL.md (88 lines)
  improve-codebase-architecture/
    DEEPENING.md (37 lines)
    INTERFACE-DESIGN.md (44 lines)
    LANGUAGE.md (53 lines)
    SKILL.md (71 lines)
  repomix-packager/
    SKILL.md (87 lines)
  session-handoff/
    evals/
      model-expectations.md (170 lines)
      results-opus-baseline.md (88 lines)
      setup_test_env.py (415 lines)
      test-scenarios.md (222 lines)
    references/
      handoff-template.md (139 lines)
      resume-checklist.md (80 lines)
    scripts/
      check_staleness.py (385 lines)
      create_handoff.py (385 lines)
      list_handoffs.py (125 lines)
      validate_handoff.py (316 lines)
    README.md (195 lines)
    SKILL.md (189 lines)
  skill-creator/
    agents/
      analyzer.md (274 lines)
      comparator.md (202 lines)
      grader.md (223 lines)
    assets/
      eval_review.html (146 lines)
    eval-viewer/
      generate_review.py (471 lines)
      viewer.html (1325 lines)
    references/
      schemas.md (430 lines)
    scripts/
      __init__.py (0 lines)
      aggregate_benchmark.py (401 lines)
      generate_report.py (326 lines)
      improve_description.py (247 lines)
      package_skill.py (136 lines)
      quick_validate.py (103 lines)
      run_eval.py (310 lines)
      run_loop.py (328 lines)
      utils.py (47 lines)
    LICENSE.txt (201 lines)
    SKILL.md (485 lines)
  swiftui-expert-skill/
    references/
      accessibility-patterns.md (215 lines)
      animation-advanced.md (403 lines)
      animation-basics.md (284 lines)
      animation-transitions.md (326 lines)
      charts-accessibility.md (135 lines)
      charts.md (602 lines)
      focus-patterns.md (299 lines)
      image-optimization.md (203 lines)
      latest-apis.md (526 lines)
      layout-best-practices.md (266 lines)
      liquid-glass.md (423 lines)
      list-patterns.md (446 lines)
      macos-scenes.md (318 lines)
      macos-views.md (357 lines)
      macos-window-styling.md (303 lines)
      performance-patterns.md (403 lines)
      previews.md (313 lines)
      scroll-patterns.md (293 lines)
      sheet-navigation-patterns.md (363 lines)
      state-management.md (388 lines)
      text-patterns.md (32 lines)
      trace-analysis.md (295 lines)
      trace-recording.md (134 lines)
      view-structure.md (780 lines)
    scripts/
      instruments_parser/
        __init__.py (1 lines)
        causes.py (187 lines)
        correlate.py (179 lines)
        events.py (291 lines)
        hangs.py (108 lines)
        hitches.py (145 lines)
        summary.py (243 lines)
        swiftui.py (195 lines)
        time_profiler.py (135 lines)
        xctrace.py (117 lines)
        xml_utils.py (224 lines)
      analyze_trace.py (301 lines)
      record_trace.py (252 lines)
    SKILL.md (165 lines)
  system-warden/
    references/
      memory-schema.md (91 lines)
    SKILL.md (244 lines)
  to-prd/
    SKILL.md (76 lines)
  triage/
    AGENT-BRIEF.md (168 lines)
    OUT-OF-SCOPE.md (101 lines)
    SKILL.md (103 lines)
  write-a-skill/
    SKILL.md (117 lines)
  zoom-out/
    SKILL.md (7 lines)
workspace/
  .agents/
    .ignore.scripts/
      analysis/
        skill_summary.csv (30 lines)
      scan_skill.py (102 lines)
    skill-analyzer/
      AGENT.md (82 lines)
      RULES.md (67 lines)
    skills/
      agent-skill-creator/
        references/
          blueprint.md (68 lines)
          file-layout.md (40 lines)
          quality-checklist.md (46 lines)
        SKILL.md (53 lines)
      skill-creator/
        agents/
          analyzer.md (274 lines)
          comparator.md (202 lines)
          grader.md (223 lines)
        assets/
          eval_review.html (146 lines)
        eval-viewer/
          generate_review.py (471 lines)
          viewer.html (1325 lines)
        references/
          schemas.md (430 lines)
        scripts/
          __init__.py (0 lines)
          aggregate_benchmark.py (401 lines)
          generate_report.py (326 lines)
          improve_description.py (247 lines)
          package_skill.py (136 lines)
          quick_validate.py (103 lines)
          run_eval.py (310 lines)
          run_loop.py (328 lines)
          utils.py (47 lines)
        LICENSE.txt (201 lines)
        SKILL.md (485 lines)
      skills-cli/
        references/
          commands.md (72 lines)
          semantics.md (34 lines)
        SKILL.md (134 lines)
        STORY.md (17 lines)
      write-a-skill/
        SKILL.md (117 lines)
    skills-archive/
      skills-cli-legacy/
        skill-use-agy/
          evals/
            evals.json (23 lines)
          references/
            commands.md (72 lines)
            lockfile.md (63 lines)
            troubleshooting.md (42 lines)
          repomix-output.xml (315 lines)
          SKILL.md (45 lines)
        skill-use-agy-workspace/
          iteration-1/
            local-directory-global-install/
              eval_metadata.json (6 lines)
            lockfile-dependency-restoration/
              eval_metadata.json (6 lines)
            remote-skill-on-the-fly-execution/
              eval_metadata.json (6 lines)
        skills-cli-kilo/
          references/
            semantics.md (26 lines)
          repomix-output.xml (208 lines)
          SKILL.md (125 lines)
  .claude/
    handoffs/
      2026-06-12-125032-workspace-cleanup-skills-cli.md (28 lines)
  evals/
    evals.json (138 lines)
  experimental_skills/
    caveman/
      SKILL.md (45 lines)
    configure-experimental-features/
      SKILL.md (87 lines)
    defuddle/
      SKILL.md (41 lines)
    diagnose/
      scripts/
        hitl-loop.template.sh (41 lines)
      SKILL.md (117 lines)
    folder-inventory/
      SKILL.md (140 lines)
    gemini-skill-importer/
      scripts/
        migrate.cjs (76 lines)
      SKILL.md (30 lines)
    git-guardrails-gemini-cli/
      scripts/
        block-dangerous-git.sh (25 lines)
      SKILL.md (95 lines)
    grill-with-docs/
      ADR-FORMAT.md (47 lines)
      CONTEXT-FORMAT.md (77 lines)
      SKILL.md (88 lines)
    improve-codebase-architecture/
      DEEPENING.md (37 lines)
      INTERFACE-DESIGN.md (44 lines)
      LANGUAGE.md (53 lines)
      SKILL.md (71 lines)
    json-canvas/
      references/
        EXAMPLES.md (329 lines)
      SKILL.md (244 lines)
    memory-handoff/
      SKILL.md (16 lines)
    migrate-to-shoehorn/
      SKILL.md (118 lines)
    mirror-docs/
      scripts/
        mirror.py (157 lines)
      SKILL.md (45 lines)
    obsidian-bases/
      references/
        FUNCTIONS_REFERENCE.md (173 lines)
      SKILL.md (497 lines)
    obsidian-cli/
      SKILL.md (106 lines)
    obsidian-markdown/
      references/
        CALLOUTS.md (58 lines)
        EMBEDS.md (63 lines)
        PROPERTIES.md (61 lines)
      SKILL.md (196 lines)
    prototype/
      LOGIC.md (79 lines)
      SKILL.md (30 lines)
      UI.md (112 lines)
    repomix/
      SKILL.md (92 lines)
    scaffold-exercises/
      SKILL.md (106 lines)
    session-handoff/
      evals/
        model-expectations.md (170 lines)
        results-opus-baseline.md (88 lines)
        setup_test_env.py (415 lines)
        test-scenarios.md (222 lines)
      references/
        handoff-template.md (139 lines)
        resume-checklist.md (80 lines)
      scripts/
        check_staleness.py (385 lines)
        create_handoff.py (385 lines)
        list_handoffs.py (125 lines)
        validate_handoff.py (316 lines)
      README.md (195 lines)
      SKILL.md (189 lines)
    setup-matt-pocock-skills/
      domain.md (51 lines)
      issue-tracker-github.md (22 lines)
      issue-tracker-gitlab.md (23 lines)
      issue-tracker-local.md (19 lines)
      SKILL.md (121 lines)
      triage-labels.md (15 lines)
    setup-pre-commit/
      SKILL.md (91 lines)
    skills-cli/
      references/
        commands.md (116 lines)
        lockfile.md (34 lines)
        troubleshooting.md (42 lines)
      SKILL.md (56 lines)
    skills-cli-claude/
      evals/
        evals.json (23 lines)
      references/
        commands.md (117 lines)
        lockfile.md (40 lines)
        troubleshooting.md (32 lines)
      SKILL.md (56 lines)
    skills-cli-claude-workspace/
      iteration-1/
        eval-0/
          with_skill/
            outputs/
              answer.md (56 lines)
          without_skill/
            outputs/
              answer.md (69 lines)
          eval_metadata.json (15 lines)
        eval-1/
          with_skill/
            outputs/
              answer.md (85 lines)
          without_skill/
            outputs/
              answer.md (61 lines)
          eval_metadata.json (19 lines)
        eval-2/
          with_skill/
            outputs/
              answer.md (52 lines)
          eval_metadata.json (15 lines)
    skills-cli-workspace/
      iteration-1/
        eval-0-directory-install/
          with_skill/
            outputs/
              response.txt (14 lines)
            timing.json (5 lines)
          without_skill/
            outputs/
              response.txt (14 lines)
            timing.json (5 lines)
          eval_metadata.json (23 lines)
        eval-1-restore-lockfile/
          with_skill/
            outputs/
              output.txt (16 lines)
              response.txt (16 lines)
            timing.json (5 lines)
          without_skill/
            outputs/
              output.txt (14 lines)
              response.txt (14 lines)
            timing.json (5 lines)
          eval_metadata.json (15 lines)
        eval-2-global-yes/
          with_skill/
            outputs/
              response.txt (17 lines)
            timing.json (5 lines)
          without_skill/
            outputs/
              response.txt (11 lines)
            timing.json (5 lines)
          eval_metadata.json (27 lines)
      evals.json (20 lines)
    system-warden/
      references/
        memory-schema.md (91 lines)
      SKILL.md (246 lines)
    tdd/
      deep-modules.md (33 lines)
      interface-design.md (31 lines)
      mocking.md (59 lines)
      refactoring.md (10 lines)
      SKILL.md (109 lines)
      tests.md (61 lines)
    to-issues/
      SKILL.md (84 lines)
    to-prd/
      SKILL.md (76 lines)
    triage/
      AGENT-BRIEF.md (168 lines)
      OUT-OF-SCOPE.md (101 lines)
      SKILL.md (103 lines)
    write-a-skill/
      SKILL.md (117 lines)
    zoom-out/
      SKILL.md (7 lines)
    README.md (89 lines)
  ExperimentalPlugins/
    .opencode/
      opencode.json (7 lines)
    knowledge-work-plugins/
      .claude-plugin/
        marketplace.json (634 lines)
      .git/
        hooks/
          applypatch-msg.sample (15 lines)
          commit-msg.sample (74 lines)
          fsmonitor-watchman.sample (168 lines)
          post-update.sample (8 lines)
          pre-applypatch.sample (14 lines)
          pre-commit.sample (49 lines)
          pre-merge-commit.sample (13 lines)
          pre-push.sample (53 lines)
          pre-rebase.sample (169 lines)
          pre-receive.sample (24 lines)
          prepare-commit-msg.sample (42 lines)
          push-to-checkout.sample (78 lines)
          sendemail-validate.sample (77 lines)
          update.sample (128 lines)
        info/
          exclude (6 lines)
        logs/
          refs/
            heads/
              main (1 lines)
            remotes/
              origin/
                HEAD (1 lines)
          HEAD (1 lines)
        refs/
          heads/
            main (1 lines)
          remotes/
            origin/
              HEAD (1 lines)
        config (13 lines)
        description (1 lines)
        HEAD (1 lines)
        packed-refs (45 lines)
      .github/
        policy/
          prompt.md (99 lines)
          schema.json (52 lines)
        workflows/
          bump-plugin-shas.yml (69 lines)
          check-mcp-urls.yml (144 lines)
          revert-failed-bumps.yml (284 lines)
          scan-plugins.yml (383 lines)
      bio-research/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          instrument-data-to-allotrope/
            references/
              asm_schema_overview.md (226 lines)
              field_classification_guide.md (503 lines)
              flattening_guide.md (254 lines)
              supported_instruments.md (151 lines)
            scripts/
              convert_to_asm.py (543 lines)
              export_parser.py (481 lines)
              flatten_asm.py (254 lines)
              validate_asm.py (1102 lines)
            LICENSE.txt (201 lines)
            requirements.txt (26 lines)
            SKILL.md (280 lines)
          nextflow-development/
            references/
              pipelines/
                atacseq.md (138 lines)
                rnaseq.md (118 lines)
                sarek.md (145 lines)
              geo-sra-acquisition.md (416 lines)
              installation.md (96 lines)
              troubleshooting.md (137 lines)
            scripts/
              config/
                pipelines/
                  atacseq.yaml (187 lines)
                  rnaseq.yaml (147 lines)
                  sarek.yaml (233 lines)
                genomes.yaml (148 lines)
              utils/
                __init__.py (69 lines)
                file_discovery.py (189 lines)
                ncbi_utils.py (808 lines)
                sample_inference.py (290 lines)
                validators.py (256 lines)
              check_environment.py (452 lines)
              detect_data_type.py (300 lines)
              generate_samplesheet.py (455 lines)
              manage_genomes.py (521 lines)
              sra_geo_fetch.py (732 lines)
            LICENSE.txt (201 lines)
            SKILL.md (290 lines)
          scientific-problem-selection/
            references/
              01-intuition-pumps.md (264 lines)
              02-risk-assessment.md (323 lines)
              03-optimization-function.md (481 lines)
              04-parameter-strategy.md (396 lines)
              05-decision-tree.md (85 lines)
              06-adversity-planning.md (123 lines)
              07-problem-inversion.md (152 lines)
              08-integration-synthesis.md (173 lines)
              09-meta-framework.md (503 lines)
            LICENSE.txt (201 lines)
            SKILL.md (269 lines)
          scvi-tools/
            references/
              atac_peakvi.md (398 lines)
              batch_correction_sysvi.md (417 lines)
              citeseq_totalvi.md (420 lines)
              data_preparation.md (286 lines)
              environment_setup.md (254 lines)
              label_transfer.md (373 lines)
              multiome_multivi.md (384 lines)
              rna_velocity_velovi.md (410 lines)
              scarches_mapping.md (401 lines)
              scrna_integration.md (429 lines)
              spatial_deconvolution.md (438 lines)
              troubleshooting.md (420 lines)
            scripts/
              cluster_embed.py (212 lines)
              differential_expression.py (220 lines)
              integrate_datasets.py (237 lines)
              model_utils.py (634 lines)
              prepare_data.py (169 lines)
              train_model.py (370 lines)
              transfer_labels.py (224 lines)
              validate_adata.py (397 lines)
            LICENSE.txt (201 lines)
            SKILL.md (155 lines)
          single-cell-rna-qc/
            references/
              scverse_qc_guidelines.md (186 lines)
            scripts/
              qc_analysis.py (232 lines)
              qc_core.py (233 lines)
              qc_plotting.py (235 lines)
            LICENSE.txt (201 lines)
            SKILL.md (175 lines)
          start/
            SKILL.md (79 lines)
        .mcp.json (48 lines)
        CONNECTORS.md (23 lines)
        LICENSE (201 lines)
        README.md (83 lines)
      cowork-plugin-management/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          cowork-plugin-customizer/
            examples/
              customized-mcp.json (40 lines)
            references/
              mcp-servers.md (91 lines)
              search-strategies.md (51 lines)
            LICENSE.txt (201 lines)
            SKILL.md (149 lines)
          create-cowork-plugin/
            references/
              component-schemas.md (396 lines)
              example-plugins.md (352 lines)
            SKILL.md (270 lines)
        LICENSE (201 lines)
      customer-support/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          customer-escalation/
            SKILL.md (248 lines)
          customer-research/
            SKILL.md (252 lines)
          draft-response/
            SKILL.md (418 lines)
          kb-article/
            SKILL.md (351 lines)
          ticket-triage/
            SKILL.md (275 lines)
        .mcp.json (40 lines)
        CONNECTORS.md (19 lines)
        LICENSE (201 lines)
        README.md (139 lines)
      data/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          analyze/
            SKILL.md (119 lines)
          build-dashboard/
            SKILL.md (924 lines)
          create-viz/
            SKILL.md (154 lines)
          data-context-extractor/
            references/
              domain-template.md (147 lines)
              example-output.md (198 lines)
              skill-template.md (148 lines)
              sql-dialects.md (121 lines)
            scripts/
              package_data_skill.py (126 lines)
            SKILL.md (227 lines)
          data-visualization/
            SKILL.md (305 lines)
          explore-data/
            SKILL.md (325 lines)
          sql-queries/
            SKILL.md (428 lines)
          statistical-analysis/
            SKILL.md (245 lines)
          validate-data/
            SKILL.md (383 lines)
          write-query/
            SKILL.md (122 lines)
        .mcp.json (36 lines)
        CONNECTORS.md (18 lines)
        LICENSE (201 lines)
        README.md (120 lines)
      design/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          accessibility-review/
            SKILL.md (128 lines)
          design-critique/
            SKILL.md (118 lines)
          design-handoff/
            SKILL.md (131 lines)
          design-system/
            SKILL.md (190 lines)
          research-synthesis/
            SKILL.md (92 lines)
          user-research/
            SKILL.md (41 lines)
          ux-copy/
            SKILL.md (107 lines)
        .mcp.json (44 lines)
        CONNECTORS.md (18 lines)
        README.md (116 lines)
      engineering/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          architecture/
            SKILL.md (85 lines)
          code-review/
            SKILL.md (118 lines)
          debug/
            SKILL.md (95 lines)
          deploy-checklist/
            SKILL.md (78 lines)
          documentation/
            SKILL.md (49 lines)
          incident-response/
            SKILL.md (158 lines)
          standup/
            SKILL.md (75 lines)
          system-design/
            SKILL.md (42 lines)
          tech-debt/
            SKILL.md (32 lines)
          testing-strategy/
            SKILL.md (33 lines)
        .mcp.json (48 lines)
        CONNECTORS.md (19 lines)
        README.md (135 lines)
      enterprise-search/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          digest/
            SKILL.md (173 lines)
          knowledge-synthesis/
            SKILL.md (258 lines)
          search/
            SKILL.md (178 lines)
          search-strategy/
            SKILL.md (222 lines)
          source-management/
            SKILL.md (173 lines)
        .mcp.json (36 lines)
        CONNECTORS.md (21 lines)
        LICENSE (201 lines)
        README.md (156 lines)
      finance/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          audit-support/
            SKILL.md (374 lines)
          close-management/
            SKILL.md (221 lines)
          financial-statements/
            SKILL.md (335 lines)
          journal-entry/
            SKILL.md (131 lines)
          journal-entry-prep/
            SKILL.md (186 lines)
          reconciliation/
            SKILL.md (175 lines)
          sox-testing/
            SKILL.md (218 lines)
          variance-analysis/
            SKILL.md (266 lines)
        .mcp.json (32 lines)
        CONNECTORS.md (20 lines)
        LICENSE (201 lines)
        README.md (91 lines)
      human-resources/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          comp-analysis/
            SKILL.md (92 lines)
          draft-offer/
            SKILL.md (82 lines)
          interview-prep/
            SKILL.md (37 lines)
          onboarding/
            SKILL.md (104 lines)
          org-planning/
            SKILL.md (28 lines)
          people-report/
            SKILL.md (99 lines)
          performance-review/
            SKILL.md (149 lines)
          policy-lookup/
            SKILL.md (94 lines)
          recruiting-pipeline/
            SKILL.md (31 lines)
        .mcp.json (28 lines)
        CONNECTORS.md (19 lines)
        README.md (137 lines)
      legal/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          brief/
            SKILL.md (208 lines)
          compliance-check/
            SKILL.md (274 lines)
          legal-response/
            SKILL.md (457 lines)
          legal-risk-assessment/
            SKILL.md (265 lines)
          meeting-briefing/
            SKILL.md (220 lines)
          review-contract/
            SKILL.md (358 lines)
          signature-request/
            SKILL.md (104 lines)
          triage-nda/
            SKILL.md (262 lines)
          vendor-check/
            SKILL.md (159 lines)
        .mcp.json (36 lines)
        CONNECTORS.md (21 lines)
        LICENSE (201 lines)
        README.md (232 lines)
      marketing/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          brand-review/
            SKILL.md (276 lines)
          campaign-plan/
            SKILL.md (308 lines)
          competitive-brief/
            SKILL.md (331 lines)
          content-creation/
            SKILL.md (157 lines)
          draft-content/
            SKILL.md (117 lines)
          email-sequence/
            SKILL.md (220 lines)
          performance-report/
            SKILL.md (392 lines)
          seo-audit/
            SKILL.md (190 lines)
        .mcp.json (60 lines)
        CONNECTORS.md (20 lines)
        LICENSE (201 lines)
        README.md (89 lines)
      operations/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          capacity-plan/
            SKILL.md (113 lines)
          change-request/
            SKILL.md (121 lines)
          compliance-tracking/
            SKILL.md (44 lines)
          process-doc/
            SKILL.md (82 lines)
          process-optimization/
            SKILL.md (39 lines)
          risk-assessment/
            SKILL.md (40 lines)
          runbook/
            SKILL.md (87 lines)
          status-report/
            SKILL.md (77 lines)
          vendor-review/
            SKILL.md (104 lines)
        .mcp.json (32 lines)
        CONNECTORS.md (20 lines)
        README.md (134 lines)
      partner-built/
        apollo/
          .claude-plugin/
            plugin.json (13 lines)
          skills/
            enrich-lead/
              SKILL.md (80 lines)
            prospect/
              SKILL.md (90 lines)
            sequence-load/
              SKILL.md (120 lines)
          .mcp.json (8 lines)
          LICENSE (21 lines)
          README.md (99 lines)
        brand-voice/
          .claude-plugin/
            marketplace.json (20 lines)
            plugin.json (9 lines)
          agents/
            content-generation.md (80 lines)
            conversation-analysis.md (98 lines)
            discover-brand.md (213 lines)
            document-analysis.md (87 lines)
            quality-assurance.md (91 lines)
          commands/
            discover-brand.md (24 lines)
            enforce-voice.md (22 lines)
            generate-guidelines.md (28 lines)
          settings/
            brand-voice.local.md.example (42 lines)
          skills/
            brand-voice-enforcement/
              references/
                before-after-examples.md (194 lines)
                voice-constant-tone-flexes.md (115 lines)
              SKILL.md (107 lines)
            discover-brand/
              references/
                search-strategies.md (271 lines)
                source-ranking.md (248 lines)
              SKILL.md (127 lines)
            guideline-generation/
              references/
                confidence-scoring.md (128 lines)
                guideline-template.md (241 lines)
              SKILL.md (141 lines)
          .mcp.json (28 lines)
          LICENSE (21 lines)
          README.md (132 lines)
        common-room/
          .claude-plugin/
            plugin.json (9 lines)
          commands/
            generate-account-plan.md (75 lines)
            weekly-brief.md (14 lines)
          references/
            me-context.md (40 lines)
            my-company-context.md (20 lines)
          skills/
            account-research/
              references/
                signals-guide.md (52 lines)
              SKILL.md (139 lines)
            call-prep/
              references/
                call-types-guide.md (55 lines)
              SKILL.md (137 lines)
            compose-outreach/
              references/
                outreach-formats-guide.md (67 lines)
              SKILL.md (135 lines)
            contact-research/
              references/
                contact-signals-guide.md (48 lines)
              SKILL.md (129 lines)
            prospect/
              references/
                prospect-guide.md (35 lines)
              SKILL.md (99 lines)
            weekly-prep-brief/
              references/
                briefing-guide.md (33 lines)
              SKILL.md (126 lines)
          .mcp.json (8 lines)
          CONNECTORS.md (25 lines)
          LICENSE (201 lines)
          README.md (64 lines)
        slack/
          .claude-plugin/
            plugin.json (11 lines)
          commands/
            channel-digest.md (34 lines)
            draft-announcement.md (27 lines)
            find-discussions.md (15 lines)
            standup.md (31 lines)
            summarize-channel.md (16 lines)
          skills/
            slack-messaging/
              SKILL.md (58 lines)
            slack-search/
              SKILL.md (97 lines)
          .mcp.json (12 lines)
          CLAUDE.md (16 lines)
          LICENSE (21 lines)
          README.md (108 lines)
        zoom-plugin/
          .claude-plugin/
            plugin.json (22 lines)
          skills/
            build-zoom-bot/
              SKILL.md (37 lines)
            build-zoom-meeting-app/
              SKILL.md (38 lines)
            choose-zoom-approach/
              SKILL.md (37 lines)
            cobrowse-sdk/
              concepts/
                distribution-methods.md (13 lines)
                jwt-authentication.md (13 lines)
                session-lifecycle.md (13 lines)
                two-roles-pattern.md (43 lines)
              examples/
                agent-integration.md (7 lines)
                annotations.md (7 lines)
                auto-reconnection.md (7 lines)
                byop-custom-pin.md (7 lines)
                customer-integration.md (7 lines)
                multi-tab-persistence.md (7 lines)
                privacy-masking.md (7 lines)
                remote-assist.md (7 lines)
                session-events.md (7 lines)
              references/
                api-official.md (104 lines)
                api-reference.md (5 lines)
                api.md (5 lines)
                authorization-official.md (90 lines)
                authorization.md (5 lines)
                environment-variables.md (20 lines)
                error-codes.md (6 lines)
                features-official.md (111 lines)
                features.md (5 lines)
                get-started-official.md (91 lines)
                get-started.md (5 lines)
                session-events.md (5 lines)
                settings-reference.md (6 lines)
              troubleshooting/
                browser-compatibility.md (7 lines)
                common-issues.md (58 lines)
                cors-csp.md (11 lines)
                error-codes.md (7 lines)
              get-started.md (554 lines)
              RUNBOOK.md (79 lines)
              SKILL.md (894 lines)
            contact-center/
              android/
                concepts/
                  sdk-lifecycle.md (41 lines)
                examples/
                  service-patterns.md (67 lines)
                references/
                  android-reference-map.md (50 lines)
                troubleshooting/
                  common-issues.md (43 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (53 lines)
              concepts/
                architecture-and-lifecycle.md (62 lines)
              ios/
                concepts/
                  sdk-lifecycle.md (45 lines)
                examples/
                  service-patterns.md (71 lines)
                references/
                  ios-reference-map.md (47 lines)
                troubleshooting/
                  common-issues.md (41 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (52 lines)
              references/
                environment-variables.md (25 lines)
                forum-top-questions.md (82 lines)
                samples-validation.md (47 lines)
                versioning-and-compatibility.md (40 lines)
              scenarios/
                high-level-scenarios.md (58 lines)
              troubleshooting/
                common-drift-and-breaks.md (61 lines)
              web/
                concepts/
                  lifecycle-and-events.md (44 lines)
                examples/
                  app-context-and-state.md (59 lines)
                references/
                  web-reference-map.md (53 lines)
                troubleshooting/
                  common-issues.md (41 lines)
                RUNBOOK.md (63 lines)
                SKILL.md (54 lines)
              RUNBOOK.md (72 lines)
              SKILL.md (121 lines)
            debug-zoom/
              SKILL.md (39 lines)
            debug-zoom-integration/
              SKILL.md (42 lines)
            design-mcp-workflow/
              SKILL.md (31 lines)
            general/
              references/
                app-types.md (106 lines)
                authentication.md (82 lines)
                authorization-patterns.md (562 lines)
                automatic-skill-chaining-rest-webhooks.md (176 lines)
                community-repos.md (158 lines)
                distributed-meeting-fallback-architecture.md (459 lines)
                environment-variables.md (38 lines)
                interview-answer-routing.md (19 lines)
                known-limitations.md (101 lines)
                marketplace.md (67 lines)
                meeting-webhooks-oauth-refresh-orchestration.md (173 lines)
                query-routing-playbook.md (86 lines)
                routing-implementation.md (247 lines)
                scopes.md (94 lines)
                sdk-logs-troubleshooting.md (194 lines)
                sdk-upgrade-guide.md (164 lines)
                sdk-upgrade-workflow.md (144 lines)
              use-cases/
                ai-companion-integration.md (392 lines)
                ai-integration.md (224 lines)
                apis-vs-mcp-routing.md (83 lines)
                backend-automation-s2s-oauth.md (221 lines)
                collaborative-apps.md (89 lines)
                contact-center-app-lifecycle-and-context-switching.md (35 lines)
                contact-center-integration.md (39 lines)
                custom-meeting-ui-web.md (96 lines)
                custom-video.md (232 lines)
                customer-support-cobrowsing.md (453 lines)
                electron-meeting-embed.md (28 lines)
                embed-meetings.md (230 lines)
                enterprise-app-deployment.md (33 lines)
                flutter-video-sessions.md (27 lines)
                form-completion-assistant.md (527 lines)
                hd-video-resolution.md (336 lines)
                high-volume-meeting-platform.md (56 lines)
                immersive-experiences.md (83 lines)
                in-meeting-apps.md (306 lines)
                marketplace-publishing.md (384 lines)
                meeting-automation.md (239 lines)
                meeting-bots.md (311 lines)
                meeting-details-with-events.md (630 lines)
                meeting-links-vs-embedding.md (37 lines)
                minutes-calculation.md (798 lines)
                native-meeting-sdk-multi-platform.md (34 lines)
                native-video-sdk-multi-platform.md (35 lines)
                prebuilt-video-ui.md (307 lines)
                probe-sdk-preflight-readiness-gate.md (34 lines)
                qss-monitoring.md (112 lines)
                raw-recording.md (172 lines)
                react-native-meeting-embed.md (27 lines)
                react-native-video-sessions.md (28 lines)
                real-time-media-streams.md (237 lines)
                recording-download-pipeline.md (308 lines)
                recording-transcription.md (302 lines)
                retrieve-meeting-and-subscribe-events.md (943 lines)
                rivet-event-driven-api-orchestrator.md (43 lines)
                saas-app-oauth-integration.md (196 lines)
                scribe-transcription-pipeline.md (58 lines)
                sdk-size-optimization.md (195 lines)
                sdk-wrappers-gui.md (560 lines)
                server-to-server-oauth-with-webhooks.md (43 lines)
                team-chat-llm-bot.md (265 lines)
                testing-development.md (341 lines)
                token-and-scope-troubleshooting.md (70 lines)
                transcription-bot-linux.md (428 lines)
                usage-reporting-analytics.md (307 lines)
                user-and-meeting-creation.md (512 lines)
                video-sdk-bring-your-own-storage.md (220 lines)
                virtual-agent-campaign-web-mobile-wrapper.md (32 lines)
                virtual-agent-knowledge-base-sync-pipeline.md (30 lines)
                web-sdk-embedding.md (207 lines)
                zoom-phone-smart-embed-crm.md (31 lines)
              RUNBOOK.md (65 lines)
              SKILL.md (320 lines)
            meeting-sdk/
              android/
                concepts/
                  architecture.md (23 lines)
                  lifecycle-workflow.md (17 lines)
                examples/
                  join-start-pattern.md (20 lines)
                references/
                  android-reference-map.md (35 lines)
                  environment-variables.md (15 lines)
                  versioning-and-compatibility.md (17 lines)
                scenarios/
                  high-level-scenarios.md (19 lines)
                troubleshooting/
                  common-issues.md (25 lines)
                android.md (19 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (46 lines)
              electron/
                concepts/
                  high-level-scenarios.md (26 lines)
                  lifecycle-workflow.md (31 lines)
                  sdk-architecture-pattern.md (24 lines)
                examples/
                  authentication-pattern.md (20 lines)
                  join-meeting-pattern.md (15 lines)
                  raw-data-pattern.md (22 lines)
                  setup-guide.md (23 lines)
                references/
                  electron-reference.md (17 lines)
                  module-map.md (33 lines)
                troubleshooting/
                  common-issues.md (25 lines)
                  deprecated-and-contradictions.md (28 lines)
                  version-drift.md (17 lines)
                RUNBOOK.md (63 lines)
                SKILL.md (86 lines)
              ios/
                concepts/
                  architecture.md (23 lines)
                  lifecycle-workflow.md (17 lines)
                examples/
                  join-start-pattern.md (20 lines)
                references/
                  environment-variables.md (15 lines)
                  ios-reference-map.md (33 lines)
                  versioning-and-compatibility.md (17 lines)
                scenarios/
                  high-level-scenarios.md (19 lines)
                troubleshooting/
                  common-issues.md (22 lines)
                ios.md (18 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (41 lines)
              linux/
                concepts/
                  high-level-scenarios.md (406 lines)
                references/
                  linux-reference.md (712 lines)
                linux.md (363 lines)
                meeting-sdk-bot.md (825 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (429 lines)
              macos/
                concepts/
                  architecture.md (23 lines)
                  lifecycle-workflow.md (17 lines)
                examples/
                  join-start-pattern.md (20 lines)
                references/
                  environment-variables.md (15 lines)
                  macos-reference-map.md (33 lines)
                  versioning-and-compatibility.md (17 lines)
                scenarios/
                  high-level-scenarios.md (19 lines)
                troubleshooting/
                  common-issues.md (22 lines)
                macos.md (17 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (41 lines)
              react-native/
                concepts/
                  architecture.md (16 lines)
                  auth-and-token-model.md (17 lines)
                  high-level-scenarios.md (25 lines)
                  lifecycle-workflow.md (20 lines)
                examples/
                  join-meeting-pattern.md (19 lines)
                  provider-hook-pattern.md (14 lines)
                  setup-guide.md (43 lines)
                  start-meeting-pattern.md (18 lines)
                references/
                  android-setup.md (15 lines)
                  ios-setup.md (13 lines)
                  native-bridge-notes.md (16 lines)
                  official-sources.md (14 lines)
                  wrapper-api.md (30 lines)
                troubleshooting/
                  common-issues.md (24 lines)
                  deprecated-and-contradictions.md (27 lines)
                  version-drift.md (17 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (106 lines)
              references/
                ai-companion.md (225 lines)
                android.md (19 lines)
                authorization.md (89 lines)
                bot-authentication.md (385 lines)
                breakout-rooms.md (490 lines)
                environment-variables.md (29 lines)
                forum-top-questions.md (99 lines)
                ios.md (27 lines)
                macos.md (16 lines)
                multiple-meetings.md (27 lines)
                signature-playbook.md (44 lines)
                triage-intake.md (51 lines)
                troubleshooting.md (132 lines)
                unreal.md (16 lines)
                webinars.md (349 lines)
              unreal/
                concepts/
                  architecture.md (23 lines)
                  lifecycle-workflow.md (14 lines)
                examples/
                  join-start-pattern.md (14 lines)
                references/
                  environment-variables.md (15 lines)
                  unreal-reference-map.md (23 lines)
                  versioning-and-compatibility.md (19 lines)
                scenarios/
                  high-level-scenarios.md (19 lines)
                troubleshooting/
                  common-issues.md (20 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (39 lines)
                unreal.md (17 lines)
              web/
                client-view/
                  references/
                    README.md (9 lines)
                  RUNBOOK.md (64 lines)
                  SKILL.md (620 lines)
                component-view/
                  references/
                    README.md (9 lines)
                  RUNBOOK.md (64 lines)
                  SKILL.md (620 lines)
                concepts/
                  browser-support.md (223 lines)
                  sharedarraybuffer.md (310 lines)
                examples/
                  client-view-basic.md (12 lines)
                  component-view-react.md (12 lines)
                references/
                  component-view-breakout-rooms.md (37 lines)
                  component-view-ui-customization.md (55 lines)
                  sharedarraybuffer-gallery-view.md (31 lines)
                  web-performance-cpu.md (25 lines)
                  web-timeout-browser-restriction.md (32 lines)
                  web-tracking-id.md (57 lines)
                  web.md (309 lines)
                troubleshooting/
                  common-issues.md (471 lines)
                  error-codes.md (275 lines)
                RUNBOOK.md (66 lines)
                SKILL.md (1127 lines)
              windows/
                concepts/
                  custom-ui-architecture.md (224 lines)
                  custom-ui-vs-raw-data.md (180 lines)
                  sdk-architecture-pattern.md (654 lines)
                  singleton-hierarchy.md (404 lines)
                examples/
                  ai-companion.md (539 lines)
                  authentication-pattern.md (702 lines)
                  breakout-rooms.md (552 lines)
                  captions-transcription.md (551 lines)
                  chat.md (413 lines)
                  custom-ui-video-rendering.md (237 lines)
                  local-recording.md (580 lines)
                  raw-video-capture.md (814 lines)
                  send-raw-data.md (478 lines)
                  service-quality.md (249 lines)
                  share-raw-data-capture.md (541 lines)
                  video-advanced.md (343 lines)
                references/
                  deployment.md (260 lines)
                  interface-methods.md (489 lines)
                  windows-reference.md (790 lines)
                troubleshooting/
                  build-errors.md (409 lines)
                  common-issues.md (575 lines)
                  windows-message-loop.md (401 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (1193 lines)
              RUNBOOK.md (72 lines)
              SKILL.md (255 lines)
            oauth/
              concepts/
                oauth-flows.md (530 lines)
                pkce.md (415 lines)
                scopes-architecture.md (244 lines)
                state-parameter.md (234 lines)
                token-lifecycle.md (484 lines)
              examples/
                device-flow.md (9 lines)
                pkce-implementation.md (9 lines)
                s2s-oauth-basic.md (9 lines)
                s2s-oauth-redis.md (295 lines)
                token-refresh.md (9 lines)
                user-oauth-basic.md (9 lines)
                user-oauth-mysql.md (9 lines)
              references/
                classic-scopes.md (6269 lines)
                environment-variables.md (23 lines)
                granular-scopes.md (3458 lines)
                oauth-errors.md (41 lines)
              troubleshooting/
                common-errors.md (13 lines)
                redirect-uri-issues.md (7 lines)
                scope-issues.md (7 lines)
                token-issues.md (7 lines)
              RUNBOOK.md (95 lines)
              SKILL.md (901 lines)
            phone/
              concepts/
                architecture-and-lifecycle.md (57 lines)
              examples/
                phone-api-service-pattern.md (41 lines)
                smart-embed-postmessage-bridge.md (49 lines)
              references/
                call-handling-patterns.md (34 lines)
                crm-sample-validation.md (36 lines)
                deprecations-and-migrations.md (30 lines)
                environment-variables.md (26 lines)
                forum-top-questions.md (95 lines)
                smart-embed-event-contract.md (37 lines)
                source-map.md (28 lines)
              scenarios/
                high-level-scenarios.md (33 lines)
              troubleshooting/
                common-issues.md (39 lines)
              RUNBOOK.md (47 lines)
              SKILL.md (85 lines)
            plan-zoom-integration/
              SKILL.md (42 lines)
            plan-zoom-product/
              SKILL.md (41 lines)
            probe-sdk/
              concepts/
                architecture-and-lifecycle.md (57 lines)
              examples/
                comprehensive-network-pattern.md (40 lines)
                diagnostic-page-pattern.md (42 lines)
              references/
                environment-variables.md (23 lines)
                probe-reference-map.md (43 lines)
                samples-validation.md (25 lines)
                source-map.md (13 lines)
                versioning-and-compatibility.md (24 lines)
              scenarios/
                high-level-scenarios.md (31 lines)
              troubleshooting/
                common-issues.md (65 lines)
              probe-sdk.md (15 lines)
              RUNBOOK.md (67 lines)
              SKILL.md (81 lines)
            rest-api/
              concepts/
                api-architecture.md (307 lines)
                authentication-flows.md (295 lines)
                meeting-urls-and-sdk-joining.md (37 lines)
                rate-limiting-strategy.md (347 lines)
              examples/
                graphql-queries.md (13 lines)
                meeting-lifecycle.md (599 lines)
                recording-pipeline.md (16 lines)
                user-management.md (16 lines)
                webhook-server.md (589 lines)
              references/
                accounts.md (125 lines)
                ai-companion.md (37 lines)
                ai-services.md (43 lines)
                authentication.md (438 lines)
                auto-dialer.md (62 lines)
                calendar.md (100 lines)
                chatbot.md (40 lines)
                clips.md (85 lines)
                cobrowse-sdk-api.md (40 lines)
                commerce.md (111 lines)
                contact-center.md (458 lines)
                crc.md (80 lines)
                environment-variables.md (21 lines)
                events.md (222 lines)
                graphql.md (484 lines)
                healthcare.md (39 lines)
                mail.md (131 lines)
                marketplace-apps.md (75 lines)
                meetings.md (327 lines)
                number-management.md (94 lines)
                openapi.md (166 lines)
                phone.md (666 lines)
                qss.md (45 lines)
                quality-management.md (48 lines)
                rate-limits.md (386 lines)
                recordings.md (70 lines)
                reports.md (86 lines)
                revenue-accelerator.md (141 lines)
                rooms.md (211 lines)
                scheduler.md (105 lines)
                scim2.md (53 lines)
                tasks.md (68 lines)
                team-chat.md (233 lines)
                users.md (125 lines)
                video-management.md (85 lines)
                video-sdk-api.md (92 lines)
                virtual-agent.md (54 lines)
                webinars.md (76 lines)
                whiteboard.md (110 lines)
                workforce-management.md (72 lines)
                zoom-docs.md (82 lines)
              troubleshooting/
                common-errors.md (429 lines)
                common-issues.md (24 lines)
                forum-top-questions.md (55 lines)
                token-scope-playbook.md (47 lines)
              RUNBOOK.md (89 lines)
              SKILL.md (594 lines)
            rivet-sdk/
              concepts/
                architecture-and-lifecycle.md (82 lines)
              examples/
                getting-started-pattern.md (43 lines)
                multi-client-pattern.md (53 lines)
              references/
                environment-variables.md (44 lines)
                rivet-reference-map.md (41 lines)
                samples-validation.md (41 lines)
                source-map.md (19 lines)
                versioning-and-compatibility.md (32 lines)
              scenarios/
                high-level-scenarios.md (60 lines)
              troubleshooting/
                common-issues.md (51 lines)
              rivet-sdk.md (15 lines)
              RUNBOOK.md (70 lines)
              SKILL.md (99 lines)
            rtms/
              concepts/
                connection-architecture.md (223 lines)
                lifecycle-flow.md (494 lines)
              examples/
                ai-integration.md (436 lines)
                manual-websocket.md (580 lines)
                rtms-bot.md (696 lines)
                sdk-quickstart.md (365 lines)
              references/
                connection.md (276 lines)
                data-types.md (322 lines)
                environment-variables.md (26 lines)
                media-types.md (240 lines)
                quickstart.md (215 lines)
                webhooks.md (275 lines)
              troubleshooting/
                common-issues.md (404 lines)
              RUNBOOK.md (83 lines)
              SKILL.md (580 lines)
            scribe/
              concepts/
                auth-and-processing-modes.md (95 lines)
              examples/
                batch-webhook-pipeline.md (65 lines)
                fast-mode-node.md (64 lines)
              references/
                api-reference.md (126 lines)
                environment-variables.md (41 lines)
                samples-validation.md (45 lines)
                versioning-and-drift.md (56 lines)
              scenarios/
                high-level-scenarios.md (86 lines)
              troubleshooting/
                common-drift-and-breaks.md (134 lines)
              RUNBOOK.md (88 lines)
              SKILL.md (117 lines)
            setup-zoom-mcp/
              SKILL.md (38 lines)
            setup-zoom-oauth/
              SKILL.md (38 lines)
            start/
              SKILL.md (46 lines)
            team-chat/
              concepts/
                api-selection.md (231 lines)
                authentication.md (36 lines)
                deployment.md (23 lines)
                environment-setup.md (301 lines)
                message-structure.md (21 lines)
                security.md (17 lines)
                webhooks.md (493 lines)
              examples/
                button-actions.md (17 lines)
                channel-management.md (11 lines)
                chatbot-setup.md (520 lines)
                database-integration.md (13 lines)
                dropdown-selects.md (13 lines)
                form-submissions.md (14 lines)
                llm-integration.md (16 lines)
                multi-step-workflows.md (12 lines)
                oauth-setup.md (49 lines)
                scheduled-alerts.md (13 lines)
                send-message.md (22 lines)
                slash-commands.md (15 lines)
                token-management.md (19 lines)
              references/
                api-reference.md (22 lines)
                environment-variables.md (21 lines)
                error-codes.md (21 lines)
                jid-formats.md (9 lines)
                message-cards.md (343 lines)
                rate-limits.md (7 lines)
                sample-comparison.md (18 lines)
                samples.md (547 lines)
                scopes.md (16 lines)
                webhook-events.md (16 lines)
              troubleshooting/
                common-issues.md (428 lines)
                deployment-issues.md (19 lines)
                message-issues.md (12 lines)
                oauth-issues.md (25 lines)
                webhook-issues.md (12 lines)
              get-started.md (60 lines)
              RUNBOOK.md (85 lines)
              SKILL.md (687 lines)
            ui-toolkit/
              references/
                environment-variables.md (19 lines)
              troubleshooting/
                common-issues.md (41 lines)
              RUNBOOK.md (63 lines)
              SKILL.md (555 lines)
            video-sdk/
              android/
                concepts/
                  architecture.md (19 lines)
                  lifecycle-workflow.md (21 lines)
                examples/
                  session-join-pattern.md (27 lines)
                references/
                  android-reference-map.md (19 lines)
                  environment-variables.md (13 lines)
                  versioning-and-compatibility.md (18 lines)
                scenarios/
                  high-level-scenarios.md (26 lines)
                troubleshooting/
                  common-issues.md (21 lines)
                android.md (32 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (38 lines)
              flutter/
                concepts/
                  high-level-scenarios.md (21 lines)
                  lifecycle-workflow.md (23 lines)
                  sdk-architecture-pattern.md (23 lines)
                examples/
                  event-handling-pattern.md (36 lines)
                  session-join-pattern.md (21 lines)
                  setup-guide.md (86 lines)
                references/
                  flutter-reference.md (12 lines)
                  module-map.md (20 lines)
                  official-sources.md (13 lines)
                troubleshooting/
                  common-issues.md (48 lines)
                  deprecated-and-contradictions.md (27 lines)
                  version-drift.md (11 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (89 lines)
              ios/
                concepts/
                  architecture.md (17 lines)
                  lifecycle-workflow.md (20 lines)
                examples/
                  session-join-pattern.md (24 lines)
                references/
                  environment-variables.md (13 lines)
                  ios-reference-map.md (18 lines)
                  versioning-and-compatibility.md (18 lines)
                scenarios/
                  high-level-scenarios.md (26 lines)
                troubleshooting/
                  common-issues.md (21 lines)
                ios.md (31 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (39 lines)
              linux/
                concepts/
                  raw-data-vs-canvas.md (571 lines)
                  sdk-architecture-pattern.md (527 lines)
                  singleton-hierarchy.md (542 lines)
                examples/
                  chat.md (9 lines)
                  cloud-recording.md (8 lines)
                  command-channel.md (321 lines)
                  live-streaming.md (9 lines)
                  qt-gtk-integration.md (9 lines)
                  raw-audio-capture.md (9 lines)
                  raw-video-capture.md (9 lines)
                  session-join-pattern.md (642 lines)
                  transcription.md (9 lines)
                  virtual-audio-video.md (8 lines)
                references/
                  linux-reference.md (800 lines)
                troubleshooting/
                  build-errors.md (96 lines)
                  common-issues.md (192 lines)
                  pulseaudio-setup.md (97 lines)
                  qt-dependencies.md (108 lines)
                linux.md (787 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (443 lines)
              macos/
                concepts/
                  architecture.md (17 lines)
                  lifecycle-workflow.md (21 lines)
                examples/
                  session-join-pattern.md (24 lines)
                references/
                  environment-variables.md (13 lines)
                  macos-reference-map.md (18 lines)
                  versioning-and-compatibility.md (18 lines)
                scenarios/
                  high-level-scenarios.md (26 lines)
                troubleshooting/
                  common-issues.md (21 lines)
                macos.md (31 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (39 lines)
              react-native/
                concepts/
                  high-level-scenarios.md (21 lines)
                  lifecycle-workflow.md (22 lines)
                  sdk-architecture-pattern.md (23 lines)
                examples/
                  event-handling-pattern.md (28 lines)
                  session-join-pattern.md (21 lines)
                  setup-guide.md (56 lines)
                references/
                  module-map.md (20 lines)
                  official-sources.md (13 lines)
                  react-native-reference.md (15 lines)
                troubleshooting/
                  common-issues.md (56 lines)
                  deprecated-and-contradictions.md (33 lines)
                  version-drift.md (11 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (85 lines)
              references/
                authorization.md (121 lines)
                environment-variables.md (25 lines)
                forum-top-questions.md (63 lines)
                licensing-and-entitlements.md (25 lines)
                session-lifecycle.md (35 lines)
                token-contract-test-spec.md (46 lines)
                triage-intake.md (40 lines)
                troubleshooting.md (59 lines)
                ui-toolkit.md (208 lines)
              unity/
                concepts/
                  architecture.md (18 lines)
                  lifecycle-workflow.md (21 lines)
                examples/
                  session-join-pattern.md (21 lines)
                references/
                  environment-variables.md (13 lines)
                  unity-reference-map.md (18 lines)
                  versioning-and-compatibility.md (17 lines)
                scenarios/
                  high-level-scenarios.md (26 lines)
                troubleshooting/
                  common-issues.md (21 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (39 lines)
                unity.md (31 lines)
              web/
                concepts/
                  sdk-architecture-pattern.md (323 lines)
                  singleton-hierarchy.md (405 lines)
                examples/
                  chat.md (491 lines)
                  command-channel.md (226 lines)
                  event-handling.md (532 lines)
                  framework-integrations.md (446 lines)
                  react-hooks.md (411 lines)
                  recording.md (435 lines)
                  screen-share.md (433 lines)
                  session-join-pattern.md (389 lines)
                  transcription.md (531 lines)
                  video-rendering.md (384 lines)
                references/
                  events-reference.md (696 lines)
                  web-reference.md (411 lines)
                  web.md (1017 lines)
                troubleshooting/
                  common-issues.md (414 lines)
                RUNBOOK.md (69 lines)
                SKILL.md (821 lines)
              windows/
                concepts/
                  canvas-vs-raw-data.md (327 lines)
                  sdk-architecture-pattern.md (298 lines)
                  singleton-hierarchy.md (492 lines)
                examples/
                  dotnet-winforms/
                    README.md (1226 lines)
                  cloud-recording.md (317 lines)
                  command-channel.md (330 lines)
                  raw-audio-capture.md (289 lines)
                  raw-video-capture.md (424 lines)
                  screen-share-subscription.md (571 lines)
                  send-raw-audio.md (343 lines)
                  send-raw-video.md (368 lines)
                  session-join-pattern.md (416 lines)
                  transcription.md (405 lines)
                  video-rendering.md (447 lines)
                references/
                  delegate-methods.md (591 lines)
                  samples.md (282 lines)
                  windows-reference.md (1221 lines)
                troubleshooting/
                  build-errors.md (321 lines)
                  common-issues.md (289 lines)
                  windows-message-loop.md (254 lines)
                RUNBOOK.md (64 lines)
                SKILL.md (1019 lines)
                windows.md (46 lines)
              RUNBOOK.md (78 lines)
              SKILL.md (372 lines)
            virtual-agent/
              android/
                concepts/
                  webview-lifecycle.md (9 lines)
                examples/
                  js-bridge-patterns.md (37 lines)
                references/
                  android-reference-map.md (14 lines)
                troubleshooting/
                  common-issues.md (21 lines)
                SKILL.md (41 lines)
              concepts/
                architecture-and-lifecycle.md (27 lines)
              ios/
                concepts/
                  webview-lifecycle.md (9 lines)
                examples/
                  js-bridge-patterns.md (32 lines)
                references/
                  ios-reference-map.md (14 lines)
                troubleshooting/
                  common-issues.md (20 lines)
                SKILL.md (41 lines)
              references/
                environment-variables.md (22 lines)
                samples-validation.md (22 lines)
                versioning-and-drift.md (21 lines)
              scenarios/
                high-level-scenarios.md (30 lines)
              troubleshooting/
                common-drift-and-breaks.md (40 lines)
              web/
                concepts/
                  lifecycle-and-events.md (30 lines)
                examples/
                  campaign-and-entry-patterns.md (37 lines)
                references/
                  web-reference-map.md (14 lines)
                troubleshooting/
                  common-issues.md (21 lines)
                SKILL.md (39 lines)
              RUNBOOK.md (31 lines)
              SKILL.md (73 lines)
            webhooks/
              references/
                environment-variables.md (14 lines)
                events.md (75 lines)
                signature-verification.md (5 lines)
                subscriptions.md (272 lines)
                verification.md (94 lines)
              troubleshooting/
                common-issues.md (33 lines)
              RUNBOOK.md (83 lines)
              SKILL.md (117 lines)
            websockets/
              references/
                connection.md (435 lines)
                environment-variables.md (18 lines)
                events.md (522 lines)
              troubleshooting/
                common-issues.md (33 lines)
              RUNBOOK.md (85 lines)
              SKILL.md (249 lines)
            zoom-apps-sdk/
              concepts/
                architecture.md (222 lines)
                meeting-sdk-vs-zoom-apps.md (33 lines)
                running-contexts.md (190 lines)
                security.md (157 lines)
              examples/
                app-communication.md (152 lines)
                breakout-rooms.md (113 lines)
                collaborate-mode.md (171 lines)
                guest-mode.md (121 lines)
                in-client-oauth.md (222 lines)
                layers-camera.md (218 lines)
                layers-immersive.md (285 lines)
                quick-start.md (258 lines)
              references/
                apis.md (274 lines)
                environment-variables.md (24 lines)
                events.md (205 lines)
                layers-api.md (501 lines)
                oauth.md (202 lines)
                zmail-sdk.md (214 lines)
              troubleshooting/
                common-issues.md (85 lines)
                debugging.md (150 lines)
                forum-top-questions.md (38 lines)
                migration.md (106 lines)
              RUNBOOK.md (106 lines)
              SKILL.md (660 lines)
            zoom-mcp/
              concepts/
                mcp-architecture.md (94 lines)
                oauth-setup.md (202 lines)
              examples/
                create-zoom-doc.md (52 lines)
                meeting-lifecycle.md (50 lines)
                search-and-act.md (87 lines)
                transcript-retrieval.md (106 lines)
              references/
                error-codes.md (59 lines)
                tools.md (149 lines)
              troubleshooting/
                common-errors.md (130 lines)
              whiteboard/
                references/
                  authentication-and-identifiers.md (56 lines)
                  tools.md (23 lines)
                SKILL.md (97 lines)
              RUNBOOK.md (66 lines)
              SKILL.md (229 lines)
          .mcp.json (25 lines)
          AGENTS.md (39 lines)
          CHANGELOG.md (12 lines)
          CONNECTORS.md (49 lines)
          CONTRIBUTING.md (186 lines)
          LICENSE (21 lines)
          README.md (122 lines)
      pdf-viewer/
        .claude-plugin/
          plugin.json (8 lines)
        commands/
          annotate.md (51 lines)
          fill-form.md (73 lines)
          open.md (34 lines)
          sign.md (54 lines)
        skills/
          view-pdf/
            SKILL.md (147 lines)
        .mcp.json (8 lines)
        CONNECTORS.md (15 lines)
        LICENSE (201 lines)
        README.md (57 lines)
      product-management/
        .claude-plugin/
          plugin.json (8 lines)
        commands/
          brainstorm.md (120 lines)
        skills/
          competitive-brief/
            SKILL.md (302 lines)
          metrics-review/
            SKILL.md (388 lines)
          product-brainstorming/
            SKILL.md (273 lines)
          roadmap-update/
            SKILL.md (266 lines)
          sprint-planning/
            SKILL.md (94 lines)
          stakeholder-update/
            SKILL.md (352 lines)
          synthesize-research/
            SKILL.md (312 lines)
          write-spec/
            SKILL.md (250 lines)
        .mcp.json (72 lines)
        CONNECTORS.md (22 lines)
        LICENSE (201 lines)
        README.md (117 lines)
      productivity/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          memory-management/
            SKILL.md (323 lines)
          start/
            SKILL.md (158 lines)
          task-management/
            SKILL.md (91 lines)
          update/
            SKILL.md (168 lines)
          dashboard.html (3098 lines)
        .mcp.json (44 lines)
        CONNECTORS.md (18 lines)
        LICENSE (201 lines)
        README.md (96 lines)
      sales/
        .claude-plugin/
          plugin.json (8 lines)
        skills/
          account-research/
            SKILL.md (287 lines)
          call-prep/
            SKILL.md (258 lines)
          call-summary/
            SKILL.md (168 lines)
          competitive-intelligence/
            SKILL.md (401 lines)
          create-an-asset/
            QUICKREF.md (78 lines)
            README.md (169 lines)
            SKILL.md (867 lines)
          daily-briefing/
            SKILL.md (263 lines)
          draft-outreach/
            SKILL.md (440 lines)
          forecast/
            SKILL.md (214 lines)
          pipeline-review/
            SKILL.md (245 lines)
        .mcp.json (60 lines)
        CONNECTORS.md (22 lines)
        LICENSE (201 lines)
        README.md (146 lines)
      small-business/
        .claude-plugin/
          plugin.json (9 lines)
        skills/
          business-pulse/
            reference/
              data_sources.md (86 lines)
              gotchas.md (103 lines)
              output_template.md (107 lines)
              thresholds.md (69 lines)
            SKILL.md (100 lines)
          call-list/
            SKILL.md (80 lines)
          canva-creator/
            reference/
              examples/
                boutique-brief-campaign.md (181 lines)
              canva-api.md (208 lines)
              gotchas.md (380 lines)
              hubspot-staging.md (137 lines)
            SKILL.md (412 lines)
          cash-flow-snapshot/
            reference/
              examples/
                worked-example.md (92 lines)
              gotchas.md (62 lines)
            SKILL.md (169 lines)
          close-month/
            SKILL.md (80 lines)
          content-strategy/
            reference/
              examples/
                retail-boutique-example.md (71 lines)
              gotchas.md (104 lines)
              square-integration.md (57 lines)
            SKILL.md (119 lines)
          contract-review/
            reference/
              examples/
                flagged-summary-saas.md (97 lines)
              docusign-fetch.md (32 lines)
              gmail-fetch.md (30 lines)
              gotchas.md (105 lines)
            SKILL.md (123 lines)
          crm-cleanup/
            SKILL.md (58 lines)
          crm-maintenance/
            reference/
              examples/
                cleanup-deal.md (83 lines)
                log-call-happy-path.md (68 lines)
                log-email-happy-path.md (50 lines)
              cleanup-checklist.md (70 lines)
              gotchas.md (92 lines)
              hubspot-fields.md (62 lines)
            SKILL.md (68 lines)
          customer-pulse/
            reference/
              examples/
                example-report.md (52 lines)
              gotchas.md (50 lines)
            SKILL.md (65 lines)
          customer-pulse-check/
            SKILL.md (79 lines)
          friday-brief/
            SKILL.md (57 lines)
          handle-complaint/
            SKILL.md (56 lines)
          invoice-chase/
            reference/
              examples/
                firm-reminder.md (28 lines)
                gentle-reminder.md (27 lines)
              gotchas.md (45 lines)
              tone-matching.md (44 lines)
            SKILL.md (83 lines)
          job-post-builder/
            reference/
              examples/
                worked-example.md (110 lines)
              gotchas.md (68 lines)
              interview-guide-structure.md (93 lines)
              job-post-structure.md (62 lines)
              offer-letter-template.md (139 lines)
            SKILL.md (344 lines)
          lead-triage/
            reference/
              examples/
                happy-path-triage.md (68 lines)
              gotchas.md (76 lines)
              hubspot-scoring.md (74 lines)
            SKILL.md (60 lines)
          margin-analyzer/
            reference/
              examples/
                retail-boutique.md (86 lines)
                service-business.md (73 lines)
              csv-schema.md (52 lines)
              gotchas.md (97 lines)
              industry-benchmarks.md (34 lines)
            SKILL.md (165 lines)
          monday-brief/
            SKILL.md (70 lines)
          month-end-prep/
            reference/
              examples/
                pl-narrative.md (52 lines)
              close-packet-format.md (101 lines)
              gotchas.md (89 lines)
              paypal-settlements.md (110 lines)
              quickbooks-reconcile.md (71 lines)
            SKILL.md (179 lines)
          month-heads-up/
            SKILL.md (64 lines)
          plan-payroll/
            SKILL.md (43 lines)
          price-check/
            SKILL.md (67 lines)
          quarterly-review/
            SKILL.md (70 lines)
          review-contract/
            SKILL.md (67 lines)
          run-campaign/
            SKILL.md (52 lines)
          sales-brief/
            SKILL.md (73 lines)
          smb-onboard/
            reference/
              examples/
                happy-path.md (128 lines)
              gotchas.md (88 lines)
              onboard-checklist.md (63 lines)
            SKILL.md (68 lines)
          smb-router/
            SKILL.md (157 lines)
          tax-prep/
            SKILL.md (47 lines)
          tax-season-organizer/
            reference/
              examples/
                quarterly-estimate.md (92 lines)
                year-end-1099.md (102 lines)
              calculation-assumptions.md (103 lines)
              connector-queries.md (93 lines)
              gotchas.md (104 lines)
            SKILL.md (211 lines)
          ticket-deflector/
            reference/
              examples/
                respond-refund-request.md (77 lines)
              gotchas.md (57 lines)
            SKILL.md (69 lines)
        .mcp.json (52 lines)
        README.md (146 lines)
      LICENSE (211 lines)
      README.md (80 lines)
    index.js (0 lines)
    package.json (13 lines)
  skill-compare/
    skills-cli-kilo-vs-skill-use-agy/
      evals/
        evals.json (107 lines)
      iteration-1/
        eval-1-project-skills-json/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (29 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (39 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-2-global-skills-with-agents/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (104 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (114 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-3-add-local-skill-project-agent/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (17 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (14 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-4-add-local-skill-global-all-agents/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (14 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (16 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-5-remove-skill-from-one-agent/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (16 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (15 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-6-update-project-skills-only/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (19 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (17 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-7-ad-hoc-use-without-install/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (16 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (15 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        eval-8-find-typescript-skill/
          skill-use-agy/
            outputs/
              command.txt (1 lines)
              response.md (13 lines)
            grading.json (68 lines)
          skills-cli-kilo/
            outputs/
              command.txt (1 lines)
              response.md (24 lines)
            grading.json (68 lines)
          eval_metadata.json (10 lines)
        benchmark.json (657 lines)
        benchmark.md (25 lines)
        review.html (1325 lines)
      comparison.json (60 lines)
      comparison.md (25 lines)
  AGENTS.md (26 lines)
  README.md (6 lines)
  SKILL.md (18 lines)
AGENTS.md (19 lines)
INDEX.json (96 lines)
INDEX.md (21 lines)
Makefile (14 lines)
skills-monorepo.code-workspace (8 lines)
SOURCES.md (25 lines)
```